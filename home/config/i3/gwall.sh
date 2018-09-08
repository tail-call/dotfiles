#!/bin/zsh

curl "https://derpibooru.org/tags/wallpaper/random_img.json?filter_id=56027" |
    sed -e 's/{"id":"\([0-9]*\)"}/https:\/\/derpibooru.org\/\1.json\n/g' | 
    xargs curl |
    # -P switch for Perl syntax (.*? - non-greedy match)
    grep -o -P '"image":".*?"' |
    sed -e 's/"image":"\(.*\)"/https:\1/' |
    xargs feh --bg-fill
