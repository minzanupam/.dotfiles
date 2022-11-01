#!/bin/sh

BLACK_FG_YELLOW_BG="\033[30;43m"

for FILE in "$@"; do

    FILE_EXT="${FILE##*.}"
    OUT_FILE="${FILE}~swap.${FILE_EXT}"

    echo -e "${BLACK_FG_YELLOW_BG}input file : $FILE \e[0m"
    echo -e "${BLACK_FG_YELLOW_BG}output file: $OUT_FILE \e[0m"

	opt=2

	case $opt in
	1)
		echo "other videos"
		# other videos
		ffmpeg -i "$FILE" -vcodec libx265 \
			-preset fast \
			-crf 28 "$OUT_FILE"
	;;
	2)
		echo "anime"
		# anime
		ffmpeg -i "$FILE" -vcodec libx265 \
			-vf scale=-1:1080 \
			-preset fast \
			-tune animation \
			-crf 28 "$OUT_FILE"

	esac

    if [ $? -eq 0 ]; then
        mv "$OUT_FILE" "$FILE"
    fi

done
