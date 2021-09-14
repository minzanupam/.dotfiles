#!/bin/sh


for FILE in "$@"; do

    FILE_EXT="${FILE##*.}"
    OUT_FILE="${FILE}~swap.${FILE_EXT}"

    echo "input file: $FILE"
    echo "output file: $OUT_FILE"

    ffmpeg -i "$FILE" -vcodec libx265 \
    -vf scale=-1:720 \
    -preset fast -tune animation \
    -crf 28 "$OUT_FILE"

    if [ $? -eq 0 ]; then
        mv "$OUT_FILE" "$FILE"
    fi

done
