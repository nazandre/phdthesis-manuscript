#! /bin/bash

#format:
# ./extractPage.sh 1 7-10

pages="$1"
pdftk thesis.pdf cat $pages output extracted.pdf
