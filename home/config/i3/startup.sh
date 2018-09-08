setxkbmap -layout us,ru -option "compose:lctrl,grp:shifts_toggle,grp_led:scroll,ctrl:nocaps,terminate:ctrl_alt_bksp"

# I don't want to run each of these programs several times

runonce ( ) {
	if ! pidof $1; then
		$* &
	fi
}

runonce nm-applet
runonce emacs --daemon
#runonce conky -c ~/.config/awesome/conky.rc
#runonce audacious -H
#runonce unclutter -idle 0.5
#runonce goldendict
runonce compton -b -I 0.07 -O 0.07 -e 0.9
runonce volumeicon
runonce cbatticon

#~/.config/i3/gwall.sh
#xsetroot -bg "#243035" -fg "#443035" -mod 1 2
feh --bg-tile ~/pics/wallpapers/responsive.png
