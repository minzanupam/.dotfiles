#!/bin/sh

BLACK_FG_YELLOW_BG="\033[30;43m"

for FILE in "$@"; do

    FILE_EXT="${FILE##*.}"
    OUT_FILE="${FILE}~swap.${FILE_EXT}"

    echo -e "${BLACK_FG_YELLOW_BG}input file : $FILE"
    echo -e "${BLACK_FG_YELLOW_BG}output file: $OUT_FILE"

    ffmpeg -i "$FILE" -vcodec libx265 \
    -vf scale=-1:720 \
    -preset fast -tune animation \
    -crf 28 "$OUT_FILE"

    if [ $? -eq 0 ]; then
        mv "$OUT_FILE" "$FILE"
    fi

done
