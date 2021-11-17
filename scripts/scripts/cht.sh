#!/bin/sh

lang_file=~/scripts/.cht-languages
cmd_file=~/scripts/.cht-command

selected=`cat $lang_file $cmd_file | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" $lang_file; then
query=`echo $query | tr ' ' '+'`
    curl cht.sh/$selected/$query
else
    curl cht.sh/$selected~$query
fi
