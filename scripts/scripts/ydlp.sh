#!/bin/sh

youtube-dl -f 134+bestaudio --get-id "$1" \
  | xargs -I '{}' -P 10 youtube-dl 'https://youtube.com/watch?v={}'
