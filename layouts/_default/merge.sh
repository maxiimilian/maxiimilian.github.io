#!/bin/bash
PAPERMOD=../../themes/hugo-PaperMod/layouts/_default/

vimdiff $PAPERMOD/single.html single.html
vimdiff $PAPERMOD/single.html pub_single.html
vimdiff $PAPERMOD/list.html pub_list.html