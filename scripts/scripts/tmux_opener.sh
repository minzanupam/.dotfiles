#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=`fzf < /home/anupam/.cache/projectlist`
fi

dirname=`basename $selected`

tmux switch-client -t $dirname
if [[ $? -eq 0 ]]; then
    exit 0
fi

tmux new-session -c $selected -d -s $dirname && tmux switch-client -t $dirname || tmux new -c $selected -A -s $dirname
