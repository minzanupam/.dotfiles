#  setopt correct

#ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
#if [[ ! -d $ZSH_CACHE_DIR ]]; then
#  mkdir $ZSH_CACHE_DIR
#fi

#source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY             # Share history between all sessions.

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/anupam/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/anupam/.zsh/vi-mode.plugin.zsh
source /home/anupam/.zsh/key-bindings.zsh
source /home/anupam/.zsh/completion.zsh

# zsh-autosuggestions config
bindkey '^ ' autosuggest-accept
bindkey '^v' edit-command-line
#bindkey -M vicmd v edit-command-line

# source "/home/anupam/.zsh/completion.zsh"
# source "/home/anupam/.zsh/key-bindings.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR=nvim

export FFF_CD_ON_EXIT=1
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

source /home/anupam/.config/fff/fffrc.sh

LFCD="/home/anupam/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
#alias lf=lfcd

start_bookmarks() {
    if [ ! -f /home/anupam/.cache/projectlist ]; then
        set_projectdir
    fi
    selected=`fzf < /home/anupam/.cache/projectlist`
    dirname=`basename $selected`
    tmux switch-client -t $dirname
    #if [[ $? -eq 0 ]]; then
    #    exit 0
    #fi
    tmux new-session -c $selected -d -s $dirname &&
    tmux switch-client -t $dirname || tmux new -c $selected -A -s $dirname
}

bookmarks() {
    if [ ! -f /home/anupam/.cache/projectlist ]; then
        set_projectdir
    fi
    selected=`fzf < /home/anupam/.cache/projectlist`
    cd $selected
}

set_projectdir () {
    find /home/anupam/work -type d -name '.git' -prune | sed 's/\.git//g' > /home/anupam/.cache/projectlist
}

#  findproj() { cd `find ~/work -maxdepth 3 -mindepth 1 -type d | fzf` }

editconf() {
    #  nvim `fzf < /home/anupam/scripts/conflist` -c 'cd %:p:h'
    # nvim `find /home/anupam/.dotfiles -type f | fzf` -c 'cd /home/anupam/.dotfiles'

	selected="/home/anupam/.dotfiles"
	tmux switch-client -t "config"
	if [[ $? -eq 0 ]]; then
		tmux send-keys "C-n"
		exit 0
	fi
	tmux new-session -c $selected -d -s "config" && tmux switch-client -t "config" || tmux new -c $selected -A -s "config"
    tmux send-keys -t config:0 "nvim -c 'cd /home/anupam/.dotfiles' -c \"lua require('telescope.builtin').git_files()\"
"
	exit 0
}

songsearch() {
    find /media/anupam/881f3c4e-63e4-4d5d-a149-e736788e2134/Songs -mindepth 1 -type f | fzf
}

readbook() {
    bookname=`find /home/anupam/Documents/Books/ | fzf --height=20 --layout=reverse`
    zathura "$bookname" &
	disown
    exit
}

bvim () {
    lynx $1 --dump | nvim "+%s/\[\d*\]/g"
}

arrange() {
    mv /home/anupam/Downloads/*.mp4 /home/anupam/Downloads/videos
    mv /home/anupam/Downloads/*.mkv  /home/anupam/Downloads/videos

    mv /home/anupam/Downloads/*.png /home/anupam/Downloads/images
    mv /home/anupam/Downloads/*.jpg /home/anupam/Downloads/images
    mv /home/anupam/Downloads/*.jpeg /home/anupam/Downloads/images

    mv /home/anupam/Downloads/*.svg /home/anupam/Downloads/icons

    mv /home/anupam/Downloads/*.pdf /home/anupam/Downloads/pdfs

    mv /home/anupam/Downloads/*.gz /home/anupam/Downloads/archives
    mv /home/anupam/Downloads/*.zip /home/anupam/Downloads/archives

    mv /home/anupam/Downloads/*.torrent /home/anupam/Downloads/torrents

    mv /home/anupam/Downloads/*.pptx /home/anupam/Downloads/docs
    mv /home/anupam/Downloads/*.docx /home/anupam/Downloads/docs
}

countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

stopwatch(){
  date1=`date +%s`
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}

nwal() {
	choice=`ls -1 /home/anupam/Pictures/wallpapers | fzf`
	nitrogen "/home/anupam/Pictures/wallpapers/${choice}"
}

fr() {
	flatpak_choice=`flatpak list | fzf | cut -f2`
	flatpak run $flatpak_choice
}

# export DENO_INSTALL=$HOME/.deno

export PATH="$PATH:/home/anupam/scripts:/home/anupam/.emacs.d/bin:/home/anupam/.local/myBin:/home/anupam/go/bin:/home/anupam/.local/share/solana/install/active_release/bin:/home/anupam/.local/bin"

export MANWIDTH=79
export CHROME_EXECUTABLE=/usr/bin/chromium
#  export MANPAGER="nvim -c 'set ft=man nu rnu nowrap hlsearch colorcolumn=79'"

alias vvifm='/home/anupam/.config/vifm/scripts/vifmrun'
alias l="exa -lagF --color=always --group-directories-first"
alias ll="l | less -r"
alias b=bookmarks
alias s=start_bookmarks
alias c="pwd | xclip -sel clip"
alias ec="editconf"
#alias tn="tmux new -s"
#alias tl="tmux list-sessions"
#alias ta="tmux attach -t"
#alias tk="tmux kill-session -t"
alias yy720="/home/anupam/scripts/ydlp.sh 136"
alias yymax="/home/anupam/scripts/ydlp.sh bestvideo"
alias yym="/home/anupam/scripts/ydlp.sh"
alias randomwallpaper="/home/anupam/work/build/styli.sh/styli.sh"
#  alias dlfile="/home/anupam/scripts/dlfile"
#  alias vi=nvim
alias dra=dragon-drag-and-drop
alias alarm="mpv /home/anupam/Documents/emergency_alarm.wav"
alias pom="countdown 1500 && alarm"
alias sob="countdown 300 && alarm"
alias lob="countdown 600 && alarm"
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'
alias liveaudio='mpv --ytdl-format=91 --vid=no'
# alias finso='flatpak run rest.insomnia.Insomnia'
alias nvmsrc="source /usr/share/nvm/init-nvm.sh"
alias aud="/home/anupam/work/build/audacium/builds/bin/Release/audacium"
# alias cht="/home/anupam/scripts/cht.sh"
alias vim=nvim
alias sxiv=nsxiv

# something to display
# figlet 'mark52s' -f mini | lolcat
# colorscript -r
# neofetch
# pfetch
# figlet 'mark52s'
# figlet 'start' | lolcat
# fortune

