#!/bin/zsh
# Adapted from https://stackoverflow.com/a/7010890

author="$1"

git log --author="$author" --pretty=tformat: --numstat | \
    awk -v author="$author" '
    {
        add += $1;
	subs += $2;
	loc += $1 - $2
    }

    END {
        printf "%s: +%s, -%s, total %s\n", author, add, subs, loc
    }
    ' -
