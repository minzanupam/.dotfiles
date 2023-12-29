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

# # from .zshrc
#
# start_bookmarks() {
#     if [ ! -f /home/anupam/.cache/projectlist ]; then
#         set_projectdir
#     fi
#     selected=`fzf < /home/anupam/.cache/projectlist`
#     dirname=`basename $selected`
#     tmux switch-client -t $dirname
#     #if [[ $? -eq 0 ]]; then
#     #    exit 0
#     #fi
#     tmux new-session -c $selected -d -s $dirname &&
#     tmux switch-client -t $dirname || tmux new -c $selected -A -s $dirname
# }
# 
# bookmarks() {
#     if [ ! -f /home/anupam/.cache/projectlist ]; then
#         set_projectdir
#     fi
#     selected=`fzf < /home/anupam/.cache/projectlist`
#     cd $selected
# }
# 
# set_projectdir () {
#     find /home/anupam/work -type d -name '.git' -prune | sed 's/\.git//g' > /home/anupam/.cache/projectlist
# }
