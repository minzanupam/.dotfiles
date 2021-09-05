#!/bin/sh

youtube-dl --get-id "$1" \
  | xargs -I '{}' -P 10 youtube-dl -f bestaudio 'https://youtube.com/watch?v={}'
