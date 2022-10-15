setxkbmap real-prog-dvorak -print -option caps:swapescape | xkbcomp -I$HOME/.config/xkb - $DISPLAY
xset r rate 400 25
