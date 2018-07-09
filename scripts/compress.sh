#! /bin/sh

#screen (screen-view-only quality, 72 dpi images)
#ebook (low quality, 150 dpi images)
#printer (high quality, 300 dpi images)
#prepress (high quality, color preserving, 300 dpi imgs)
#default (almost identical to /screen)

quality=prepress

document="andre-naz-phdthesis.pdf"
documentCMP="andre-naz-phdthesis-cmp.pdf"
verbose="1"

if [ "$#" -eq 3 ]; then
    document="$1"
    documentCMP="$2"
    verbose="$3"
    echo "Parameters read!"
fi

#https://stackoverflow.com/questions/1659147/how-to-use-ghostscript-to-convert-pdf-to-pdf-a-or-pdf-x#9343820
compressDoc() {
    gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/$quality -sOutputFile=$documentCMP $document
}

echo "compressing..."
if [ $verbose -eq 1 ]; then
    compressDoc
else
    compressDoc > /dev/null 2>&1
fi

echo "Done!"

ls -alh $document
ls -alh $documentCMP
