#! /bin/bash

function crop {
    bn="$1"
    convert "$bn.jpg" -crop 2808x1908+556+540 "$bn-cropped.jpg"
}

crop "v1"
crop "v2"

