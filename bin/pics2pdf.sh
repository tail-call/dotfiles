#!/bin/bash

# Requires:
#   img2pdf (python3 -m pip install img2pdf)
#   qpdf (brew install qpdf)

set -euo pipefail
IFS=$'\n\t'

files=($@)

dir=$(mktemp -d)
dest=$(pwd)

for file in "${files[@]}"; do 
    echo "Converting $file..."
    img2pdf "$file" --pagesize 210mm > "$dir/${file##*/}.pdf"
done

function make_qpdf_params() {
    echo '--empty'
    echo '--pages'
    for file in "${files[@]}"; do 
        echo "$file.pdf"
        echo 1
    done
    echo '--'
    echo non-linearized.pdf
}

pushd "$dir"
    make_qpdf_params | xargs echo qpdf
    make_qpdf_params | xargs qpdf
    qpdf --linearize non-linearized.pdf "${dest}/output.pdf"
popd

echo "Removing:"
rm -rvf "$dir"
