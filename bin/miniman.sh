#!/bin/bash

grep -i "$@" <<EOF | awk -F '#' '{ printf("%s:\n$ %s\n\n", $2, $1) }'
cat -v <file> #Show ^J, ^M and so on
ffmpeg -i <input> -ss 00:26:59.0 -c copy -t 00:01:42.0 <output> #Copy part of file: -ss from, -t to
ffmpeg -r 25 -i preview.png -c:v libx264 -vf "fps=25,format=yuv420p" preview.mp4 # Create 1 frame video from image
echo -e 'file preview.mp4\nfile vid.mp4' | ffmpeg -f concat -safe 0 -protocol_whitelist pipe,file -i pipe:0 -c copy output.mp4 #Concat videos
ffprobe -v error -select_streams v -of default=noprint_wrappers=1:nokey=1 -show_entries stream=r_frame_rate vid.mp4 #Get video's FPS as a fraction
find . -name '*glob-expression*' #Search for files in current directory (the dot character)
setfattr -n user.anything -v "value" file #Set attribute "anything" of file to "value"
tc qdisc add dev wlp3s0 root tbf rate 1024kbit latency 50ms burst 1540 #Limit network speed on wlp3s0
xxd -rp #Convert hexadecimal stream to binary stream, ignore garbage
zip file.zip -r * #Zip all files in current directory and write them to file.zip
git tag -a v.0.0.x -m 'Release 0.0.x' #Create tag at current commit
git push --tags #Push local tags to origin
git push origin --delete <branch-name> #Delete remote branch
git clean -fd --tags #Delete uncommited directories
git clean -fX --tags #Delete uncommited files
git merge -X ours other-branch (or theirs) #Merge resolving conflicts in favor of current branch (or other branch)
git merge -s ours other-branch (or theirs) #Merge ignoring changes in other branch (or current branch)
git ls-files --error-unmatch <file> #Check if file is version controlled (will exit with 1 if file is not tracked)
git archive --format=zip HEAD -o source.zip #Creates a zip from current branch
pod repo update #Update pods repository
pkgutil --expand <source.pkg> <dest.dir> #Unpack .pkg file (macOS only)
pkgutil --expand-full <source.pkg> <dest.dir> #Unpack .pkg file including a Payload file (use if --expand fails)
img2pdf 04.jpg --imgsize 26.46cm > 04.pdf #Convert image to PDF with specified size
qpdf --empty --pages 01.pdf 1 02.pdf 1  -- out.pdf #Create PDF from specific pages of specific PDFs
qpdf bottom.pdf --overlay top.pdf -- overlaid.pdf #Overlay one PDF over another
unzip -l file.zip #List files in a zip 
nslookup example.com#Get IP address of a remote host
EOF
