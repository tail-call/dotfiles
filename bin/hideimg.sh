#!/bin/zsh

set -euo pipefail
password=$(echo qweasdzxcjkluio | sed 's/\(.\)/\1\n/g' | shuf -n 6 | tr -d '\n')

file="$1"
result="$file.$password.pdf" 

img2pdf "$file" --pagesize 210cm --output "$result"
qpdf "$result" --allow-weak-crypto --replace-input --encrypt "$password" "$password" 128 -- \
