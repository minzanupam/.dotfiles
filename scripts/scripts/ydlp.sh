#!/bin/sh

if [ "$#" -eq 1 ]; then
    youtube-dl --get-id "$1" \
      | xargs -I '{}' -P 10 youtube-dl -f bestaudio 'https://youtube.com/watch?v={}'
else
    youtube-dl --get-id "$2" \
      | xargs -I '{}' -P 10 youtube-dl -f $1+bestaudio 'https://youtube.com/watch?v={}'
fi
