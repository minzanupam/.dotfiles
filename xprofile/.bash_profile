#
# ~/.bash_profile
#

# path
PATH="$PATH:/opt/appimages"
PATH="$PATH:/home/anupam/.local/bin"
PATH="$PATH:/home/anupam/go/bin"
PATH="$PATH:/home/anupam/scripts"
PATH="$PATH:$HOME/.config/emacs/bin"
export PATH

source $HOME/.cargo/env

# college proxy
proxy_var="http://edcguest:edcguest@172.31.102.29:3128"
# proxy_var="http://edcguest:edcguest@172.31.100.27:3128"
# proxy_var="http://edcguest:edcguest@172.31.100.25:3128"
export http_proxy=$proxy_var
export no_proxy="localhost,131.0.0.1,192.168.1.1,::1,*.local"
export HTTP_PROXY=$proxy_var
export NO_PROXY="localhost,131.0.0.1,192.168.1.1,::1,*.local"
export https_proxy=$proxy_var
export HTTPS_PROXY=$proxy_var

# for weston wayland
export LD_LIBRARY_PATH=/usr/local/lib/

# for qt
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=gtk2

# if you want to use amd-driver
# export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json


if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi

# [[ -f ~/.bashrc ]] && . ~/.bashrc
# . "$HOME/.cargo/env"
