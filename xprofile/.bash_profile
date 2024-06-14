#
# ~/.bash_profile
#

# path
# PATH="$PATH:/opt/appimages"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/go/bin"
PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/.config/emacs/bin"
PATH="$PATH:$HOME/.npm-packages/bin"
# PATH="$PATH:/opt/instantclient_21_13"
export PATH

export NODE_PATH=~/.npm-packages/lib/node_modules

source $HOME/.cargo/env

# college proxy
# proxy_var="http://edcguest:edcguest@172.31.102.29:3128"
# proxy_var="http://edcguest:edcguest@172.31.100.27:3128"
# proxy_var="http://edcguest:edcguest@172.31.100.25:3128"
# export http_proxy="http://edcguest:edcguest@172.31.100.27:3128"
# export http_proxy="http://edcguest:edcguest@172.31.102.29:3128"
# export http_proxy="http://edcguest:edcguest@172.31.100.14:3128"
# export HTTP_PROXY=$http_proxy
# export https_proxy=$http_proxy
# export HTTPS_PROXY=$http_proxy
# export no_proxy="localhost,131.0.0.1,192.168.1.1,::1,*.local,127.0.0.1"
# export NO_PROXY=$no_proxy

# source $HOME/.proxy.conf

# for orcale client
# for weston wayland
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/instantclient_21_13"
#
# for qt
# export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=gtk2
# for gtk4
# export GTK_THEME=Adwaita:dark

# if you want to use amd-driver
# export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json


if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi

# [[ -f ~/.bashrc ]] && . ~/.bashrc
# . "$HOME/.cargo/env"

# if [ -e /home/anupam/.nix-profile/etc/profile.d/nix.sh ]; then . /home/anupam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
