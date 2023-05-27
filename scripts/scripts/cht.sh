#!/bin/sh

lang_file=~/scripts/.cht-languages
cmd_file=~/scripts/.cht-command

selected=`cat $lang_file $cmd_file | fzf`
read -p "Enter Query: " query

# if grep -qs "$selected" $lang_file; then
# 	query=`echo $query | tr ' ' '+'`
#     # curl cht.sh/$selected/$query
# 	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
#     # tmux neww bash -c "curl -s cht.sh/$selected/$query | less -R"
# else
#     # curl cht.sh/$selected~$query
#     tmux neww bash -c "curl -s cht.sh/$selected~$query | less -R"
# fi


query=`echo $query | tr ' ' '+'`
# curl cht.sh/$selected/$query | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' | nvim
curl cht.sh/$selected/$query | bat
