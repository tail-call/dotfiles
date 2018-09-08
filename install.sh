#!/bin/bash

# This script installs dotfiles in their appropriate locations using
# symlinking.

function abspath() {
    readlink -m "$1"
}

function abslink() {
    ln -s $(abspath "$1") "$2"
}

cd "$(dirname "$0")/home"

abslink ../bin ~/bin

abslink config/feh ~/.config
abslink config/i3 ~/.config
abslink config/i3status ~/.config
abslink config/luakit ~/.config
abslink config/milkytracker ~/.config
abslink config/nvim ~/.config
abslink config/termite ~/.config
abslink config/user-dirs.dirs ~/.config

abslink dosbox ~/.dosbox
abslink vifm ~/.vifm
abslink XCompose ~/.XCompose
abslink Xmodmap ~/.Xmodmap
abslink Xresources ~/.Xresources
abslink bashrc ~/.bashrc
abslink csirc ~/.csirc
abslink fehbg ~/.fehbg
abslink nethackrc ~/.nethackrc
abslink profile ~/.profile
abslink xinitrc ~/.xinitrc
abslink xinputrc ~/.xinputrc
abslink zshenv ~/.zshenv
abslink zshrc ~/.zshrc
