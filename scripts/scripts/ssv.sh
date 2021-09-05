#!/bin/sh

choice=`ls $HOME/Downloads/*.svg | fzf`

xclip -sel clip $choice
