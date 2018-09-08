#!/bin/zsh

file="$1"

if [[ -z "$file" ]]; then >&2 cat << EOF
Usage: ppack archive.tar
EOF
exit 1
fi

split --verbose -d -b 48000000 "$file" pak

for file in pak[0-9]*; do
     >&2 echo Converting $file.
     cpng $file -w 4000 > $file.png
done

>&2 echo Cleaning up...
rm -vf pak*[0-9]
