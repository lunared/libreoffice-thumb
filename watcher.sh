#!/bin/sh

IN_DIR=/mnt/in/
OUT_DIR=/mnt/out/

inotifywait -m --format="%w%f" -e close_write $IN_DIR | while read file; do

    filename=${file##*/}
    extension="${filename##*.}"
    filename=${filename%.*}
    echo "converting $filename"
    # do not have libreoffice convert a pdf to a pdf because it can't handle
    # embedded fonts in pdfs, plus it's just redundant
    if [ ! $extension = 'pdf' ]; then
        libreoffice --headless --convert-to pdf --outdir /tmp $file
        file="/tmp/${filename}.pdf"
    fi
    convert -density 300 $file[0] "${OUT_DIR}${filename}.png"
    # when files are done converting, be sure to execute the callback
    # that might have been provided

    if [ ! -z $CALLBACK ]; then
        eval $CALLBACK
    fi
done
