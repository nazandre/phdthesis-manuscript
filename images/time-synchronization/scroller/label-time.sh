#! /bin/bash

for img in $(ls raw/*.png); do
    output=$(basename $img)
    time=$(basename $img .png | cut -d '_' -f 2)
    echo "$output => $time"
    #convert -pointsize 100 -fill white -draw "text 75,75 \"Elapsed time: $time\" " $img $output
    convert -splice 0x75 -background black -pointsize 100 -fill white -draw "text 50,90 \"Elapsed time: $time\" " $img $output
done
