#! /bin/bash

input="andre-naz-phdthesis.pdf"
output="andre-naz-phdthesis-pdfa.pdf"

gs -dPDFA -dBATCH -dNOPAUSE -sProcessColorModel=DeviceRGB -sDEVICE=pdfwrite -sPDFACompatibilityPolicy=1 -sOutputFile="$output" "$input"
