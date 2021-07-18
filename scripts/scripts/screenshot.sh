#!/bin/sh

SCREENSHOT_DIRECTORY="/tmp/screenshots/"

if [ $(command -v maim > /dev/null) ]; then
    echo "install maim first"
    exit
fi

function take_screenshot() {
    if [ ! -d "$SCREENSHOT_DIRECTORY" ]; then
        mkdir $SCREENSHOT_DIRECTORY
    fi
    maim -s | tee ${SCREENSHOT_DIRECTORY}$(date +'screenshot-%Y-%m-%d::%H:%M:%S:%3N').png | xclip -sel clip -t image/png -i 
}

take_screenshot
