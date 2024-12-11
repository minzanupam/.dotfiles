#!/bin/sh

bookname=`find $HOME/Documents/Books -name '*.pdf' | 
	cut -d'/' -f6- | 
	fzf --height=20 --layout=reverse`
bookpath=$HOME/Documents/Books/$bookname

if [ "$bookname" != "" ]; then 
	# prog=zathura
	prog=org.kde.okular
	$prog "$bookpath" & disown
else
	exit 1
fi 
