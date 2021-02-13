---
title: Combining Jupyter and Hugo
date: 2020-02-13
author: Maximilian Pierzyna
tags:
- Linux
- Machine Learning
---
Here, I briefly present my workflow to convert Jupyter notebooks to Hugo articles.

## Setup
```bash
pip install jupyter nbconvert
```

## Convert Notebook to Markdown
```bash
jupyter nbconvert --to markdown notebook.ipynb
```
You will end up with the markdown file `notebook.md` and a directory containing the notebook's assets called `notebook_files`. 

## Create new Hugo Post
To keep the notebook's main text and its assets together I decided to not put the assets into Hugo's `/static` directory. 
Instead we create a new folder in `/content/` (or wherever the post should appear) and give it the name of our post. Here, I name it `notebook`.

The files generate by Jupyter have to be moved there:
```bash
mv notebook.md $HUGO_ROOT/content/notebook/index.md
mv notebook_files $HUGO_ROOT/content/notebook/
```
`$HUGO_ROOT` is the root directory of our Hugo page, and it is important to **rename the notebook file to `index.md`** so that the `notebook/` directory is served as a single article. 
A front matter should to be added to the Markdown file to provide meta data for Hugo. 

By keeping the original file structure created by `nbconvert`, all linked images should be rendered without problems.
