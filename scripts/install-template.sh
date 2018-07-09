#! /bin/bash

templateDir="template"

userTexmf=$(eval echo "~/texmf")
styDir="$userTexmf/tex/latex"
bstDir="$userTexmf/bibtex/bst"

(
    cd "$templateDir"
    
    bstFiles="$(ls -N *.bst | tr '\n' ' ')"
    styFiles="$(find . -type f ! -name '*.bst' | tr '\n' ' ')"

    echo "--------------"
    echo "BST: $bstFiles"
    echo "bstDir: $bstDir"
    echo "--------------"
    echo "STY: $styFiles"
    echo "styDir: $styDir"
    echo "--------------"
    
    mkdir -p "$styDir"
    mkdir -p "$bstDir"
    
    cp $bstFiles "$bstDir"
    cp $styFiles "$styDir"
)

sudo texhash $userTexmf
