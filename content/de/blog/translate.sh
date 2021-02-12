#!/bin/bash

for f_path in ../../en/blog/*; do
    f_name=${f_path##*/}
    if [[ ! -e ./$f_name ]]; then
        echo "$f_name not translated"
        
        # Determine final line of front matter
        # Not in use
        fm_end=$(cat $f_path | grep -e "---" -n -m2 | tail -n1 | grep -e "\d*" -o)
        #head -n $fm_end $f_path

        cp $f_path ./$f_name
        echo "Copyied here. Please translate!"
    fi
done


