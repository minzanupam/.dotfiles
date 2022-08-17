#!/bin/sh

color_picked=`xcolor | tr A-Z a-z`
new_color=`yad --color --init-color=$color_picked | tr A-Z a-z`

if [ $new_color != "" ]; then
	color_picked=$new_color
fi

xclip -sel clip <<< $color_picked
