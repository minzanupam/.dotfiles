#!/bin/sh

choice=`ls -1 $HOME/Templates | fzf`

echo $choice
cp "$HOME/Templates/$choice" .
