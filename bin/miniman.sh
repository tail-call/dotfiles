#!/bin/bash

grep -i "$@" <<EOF | awk -F '#' '{ printf("%s:\n$ %s\n\n", $2, $1) }'
cat -v <file> #Show ^J, ^M and so on
ffmpeg -i <input> -ss 00:26:59.0 -c copy -t 00:01:42.0 <output> #Copy part of file: -ss from, -t to
find . -name '*glob-expression*' #Search for files in current directory (the dot character)
setfattr -n user.anything -v "value" file #Set attribute "anything" of file to "value"
tc qdisc add dev wlp3s0 root tbf rate 1024kbit latency 50ms burst 1540 #Limit network speed on wlp3s0
xxd -rp #Convert hexadecimal stream to binary stream, ignore garbage
zip file.zip -r * #Zip all files in current directory and write them to file.zip
git tag -a v.0.0.x -m 'Release 0.0.x' #Create tag at current commit
git push --tags #Push local tags to origin
git clean -fd --tags #Delete uncommited directories
git clean -fX --tags #Delete uncommited files
git merge -X ours other-branch (or theirs) #Merge resolving conflicts in favor of current branch (or other branch)
git merge -s ours other-branch (or theirs) #Merge ignoring changes in other branch (or current branch)
EOF
