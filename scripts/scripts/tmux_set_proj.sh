#!/bin/bash

find $HOME/work -type d -name '.git' -prune | sed 's/\.git//g' > /home/anupam/.cache/projectlist
