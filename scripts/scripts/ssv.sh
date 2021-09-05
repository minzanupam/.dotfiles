#!/bin/sh

choice=`ls $HOME/Downloads/*.svg $HOME/Downloads/icons/*.svg | fzf`

xclip -sel clip $choice
