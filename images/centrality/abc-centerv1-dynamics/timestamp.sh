#! /bin/bash

declare -A timestamps=( ["0"]="2.501667" ["1"]="4.970000" ["2"]="9.673333" ["3"]="11.675000" )

for img in $(ls raw/*.png); do
    output=$(basename $img)
    id=$(basename $img .png)
    time=${timestamps[$id]}
    echo "$output => $time"
    convert -splice 0x75 -background black -pointsize 100 -fill white -draw "text 50,90 \"Elapsed time: $time seconds\" " -draw "gravity southeast \
         fill black rectangle 1593,982,1888,1113" $img $output
done
