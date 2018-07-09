#! /bin/sh

filename="$1"
verbose="$2"

export TEXINPUTS=template/:$TEXINPUTS
export BSTINPUTS=template/:$BSTINPUTS

if [ "$verbose" -eq 0 ]; then
    echo "TEXINPUTS: $TEXINPUTS"
    echo "BSTINPUTS: $BSTINPUTS"
fi

compileToPDF () {
    pdflatex $filename.tex
}

compileAllSteps() {
    compileToPDF
    makeglossaries $filename
    bibtex $filename.aux
    compileToPDF
    bibtex $filename.aux
    compileToPDF
}

echo "Compiling..."

if [ "$verbose" -eq 1 ]; then
    compileAllSteps    
else
    compileAllSteps > /dev/null 2>&1
fi

echo "Done!"
