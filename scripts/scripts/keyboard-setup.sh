# setxkbmap real-prog-dvorak -print -option caps:swapescape | xkbcomp -I$HOME/.config/xkb - $DISPLAY
setxkbmap -option caps:swapescape
xmodmap /home/anupam/.config/xkb/xmodmap/real-prog-dvorak-xmodmap
xset r rate 400 25
