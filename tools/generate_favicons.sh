#!/usr/bin/env bash
SRC=$1
DST=../static

if [[ "$SRC" == "" ]]; then
    echo "Usage: generate_favicons.sh favicon.svg"
    exit 1
fi

echo "Generating PNG and ICO files in $DST..."

# PNG (Apple Touch Icon)
inkscape --export-type="png" -w 180 --export-filename $DST/apple-touch-icon.png $SRC

# PNG (Android)
inkscape --export-type="png" -w 192 --export-filename $DST/android-chrome-192x192.png $SRC
inkscape --export-type="png" -w 512 --export-filename $DST/android-chrome-512x512.png $SRC

# ICO (use PNG as base)
convert $DST/apple-touch-icon.png -define icon:auto-resize=64,48,32,16 $DST/favicon.ico

echo "Done."
