#! /bin/bash

rm -rf tmp
mkdir tmp

mkdir -p dynamics-3

(
    cd tmp
    
    ffmpeg -i ../ABCcenter2.mov -r 30 -vf "drawtext=fontfile=/Windows/Fonts/Arial.ttf: text='Elapsed time\:\\
%{pts\\:flt} seconds': x=w-w/1.9: y=h/20: fontcolor=white: box=1: boxcolor=0x00000000@1: fontsize=100" -f image2 %04d.png

    #ffmpeg -i ../ABC-Center-Square7x7-Dynamic.mov -r 2 -vf "crop=982:934:462:14, drawtext=fontfile=/Windows/Fonts/Arial.ttf: text='%{pts}time\: %{eif\:n*(1/30)\:d}.%{eif\:S*(1/30)\:d}s': x=(w-tw)/2: y=h-h/8: fontcolor=white: box=1: boxcolor=0x00000000@1: fontsize=30" -f image2 %04d.png

    #cp 0076.png ../dynamics-2/0.png
    #cp 0150.png ../dynamics-2/1.png
    #cp 0291.png ../dynamics-2/2.png
    #cp 0351.png ../dynamics-2/3.png

)

#rm -rf tmp
