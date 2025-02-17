---
Title: Parallelizing Python scripts with Slurm arrays
---
Sometimes, you have a simple Python script that iteratively performs a lot of similar tasks.
Think of a script, for example, that post-processes a large number of raw files, where each execution can happen independently.
These scripts can be easily parallized with Slurm arrays. 

Submitting a job as a Slurm array is like asking Slurm to run a for-loop. You will have access to an extra environment variable, the `$SLURM_ARRAY_TASK_ID`, which is the iteration variable of your loop.


## Simple sequential for-loop with sbatch script

Let's look at a sequential example first. Assume you have the following simple Python script, which processes a bunch of files.
```python
## process.py
FILES = [
    "data_01.nc",
    "data_02.nc",
    "data_03.nc",
    "data_04.nc",
]

# Pythonic for-loop
for f in FILES:
    process(f)

# Alternative for-loop, more common in C-style languages
for i in range(len(FILES)):
    process(FILES[i])
```
We can run this script by creating a simple accompanying Slurm job script.

```bash
## process.job.sh
#SBATCH --job-name=processing
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=4000

# Run the script
python process.py
```

Finally, the job is submitted with `sbatch process.job.sh`.

The disadvantage of this method is that we do not utilize the fact that each loop execution is independent of the previous one or the one after.
In other words, all files could be processed in parallel by running the Python script multiple times.
This is where Slurm can help.

## Making Slurm run the loop
We can easily convert such a script to a Slurm array by moving the for-loop "outside of the script".
First, our script needs to take command line arguments:
```python
## process.py
import argparse


FILES = [
    "data_01.nc",
    "data_02.nc",
    "data_03.nc",
    "data_04.nc",
]

# Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument("i", help="Number of file in FILES to process")
args = parser.parse_args()

# Run post-processing for i-th file
process(FILES[args.i])
```

The i-th file (e.g., the third file) can now be processed by running the following command:

```bash
python process.py 3
```
Next, the job script needs a small modification. Instead of providing a fixed number as argument to the script like above, we provide the variable `$SLURM_ARRAY_TASK_ID`. This variable will be populated by Slurm in the final step, so the updated job script looks like this:
```bash
## process.job.sh
#SBATCH --job-name=processing
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=4000

# Run the script
python process.py $SLURM_ARRAY_TASK_ID
```

Finally, we need to tell Slurm to run the loop for us by submitting this job as an array:
```bash
sbatch --array=0-3 process.job.sh
```
This will automatically submit the script four times where the `$SLURM_ARRAY_TASK_ID` is increased from 0 to 3. 
In other words, Slurm will run

```bash
python process.py 0
python process.py 1
python process.py 2
python process.py 3
```

Each job will receive the ressources specified in the job script. 
This method can be applied very widely and not just for file processing. 
Assume, you want to train a machine learning model with a pre-defined number of settings. 
You can list these settings in a list similar to `FILES` and pass the settings as arguments to a `train()` function similar to the `process()` call in this example.
Sometimes, it is also needed to run the same experiment in a randomized fashion (e.g., Monte Carlo simulations or training of a machine learning ensemble). 
In that case, you can simply provide the `i` argument, i.e., the `$SLURM_ARRAY_TASK_ID`, as random seed for your random number generator.
As a result, each script will have its own chain of random numbers while still being reproducible through a fixed seed.

On a more practical note, if submitting hunderts of jobs through an array, it might be polite to limit the number of jobs that can run in parallel. 
In principle, the scheduler (Slurm) will not run more jobs than it has physical resources available.
However, if you share a partition with your department, you might still exhaust all the resources available to your colleagues -- so, none of them can run jobs anymore.
To avoid this, we can, for example, process 100 files but only 10 of them in parallel by running
```bash
sbatch --array=0-99%10 process.job.sh
```
The `%10` in the array definition defines the number of allowed parallel jobs, here, ten.

## A note on numpy
Numpy is a popular scientific computing library in Python. It is highly optimized and will run many operations in parallel by itself.
However, numpy sometimes (always?) does not detect when it is run on a high-performance computer (HPC) where it only has access to a subset of resources. 
Say, a compute node has 64 cores, but you submit a job requesting only 8 cores. 
Numpy might still assume that it can use all 64 cores when, in fact, it cannot. 
The result might be a slow down because numpy starts 64 parallel activities (threads), which have to compete for the eight "real slots" of parallel execution.
To avoid this issue, we can tell numpy to only use as many cores as the job requested.

Instead of simply running your Python script like above...
```bash
## process.job.sh
#SBATCH --job-name=processing
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=4000

# Run the script
python process.py $SLURM_ARRAY_TASK_ID
```

... we modify it like this:
```bash
## process.job.sh
#SBATCH --job-name=processing
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=4000

# Run the script
OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK \
OPENBLAS_NUM_THREADS=$SLURM_CPUS_PER_TASK \
MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK \
VECLIB_MAXIMUM_THREADS=$SLURM_CPUS_PER_TASK \
NUMEXPR_NUM_THREADS=$SLURM_CPUS_PER_TASK \
python process.py $SLURM_ARRAY_TASK_ID
```

Don't get scared by this slightly intimidating call of `python`.
Prefixing the `python` command like this tells the different underlying high-performance parts of Python (OpenMP, OpenBLAS, MathKernelLibrary MKL, VecLib, ...) to only use `$SLURM_CPUS_PER_TASK`. 
That variable will get populated by Slurm with what is given in the script, here, 8 cores.
