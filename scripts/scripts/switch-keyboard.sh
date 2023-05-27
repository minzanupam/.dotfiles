#!/bin/sh

OPTION_FILE=$HOME/.local/state/my-keyboard/option

read option < $OPTION_FILE

if [ $? != 0 ]; then
	option="dvorak"
	echo dvorak > $OPTION_FILE
fi

if [ $option = "dvorak" ]; then
	setxkbmap -layout us
	echo "switched to querty"
	echo "querty" > $OPTION_FILE
else
	setxkbmap -option caps:swapescape
	xmodmap /home/anupam/.config/xkb/xmodmap/real-prog-dvorak-xmodmap
	echo "switched to dvorak"
	echo "dvorak" > $OPTION_FILE
fi

xset r rate 400 25
