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

#source /home/anupam/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/anupam/.zsh/vi-mode.plugin.zsh
source /home/anupam/.zsh/key-bindings.zsh
# source /home/anupam/.zsh/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

alias lf=lfrun
LFCD="/home/anupam/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lf=lfcd

#  findproj() { cd `find ~/work -maxdepth 3 -mindepth 1 -type d | fzf` }

editconf_old() {
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


editconf() {
	selected="$HOME/.dotfiles"
	tmux new-session -c $selected -d -s "config"
	if [[ $? -eq 0 ]]; then
		tmux send-keys -t config:0 "vim" Enter "C-n"
		tmux attach -t "config"
	else
		tmux attach-session -d -t "config"
	fi
}


songsearch() {
    find /media/anupam/881f3c4e-63e4-4d5d-a149-e736788e2134/Songs -mindepth 1 -type f | fzf
}

bvim () {
    lynx $1 --dump | nvim "+%s/\[\d*\]/g"
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
	flatpak run $flatpak_choice $@
}

tmn() {
	tmux new -s ${PWD##*/}
}

sch() {
    ch=`find $HOME/work/playground/rough -type d -name '.git' -prune -maxdepth 3 | sed 's/\.git//g' | fzf`
	cd $ch
	nvim .
}

# sourcefile() {
# 	SOURCEFILE_COMMAND=`echo '/usr/share/nvm/init-nvm.sh
# /opt/anaconda/bin/activate' | fzf`
# 	source $SOURCEFILE_COMMAND
# }

# export DENO_INSTALL=$HOME/.deno

# export PATH="$PATH:/home/anupam/scripts
# PATH="$PATH:/home/anupam/go/bin"
# PATH="$PATH:/home/anupam/scripts"
# export PATH

# export MANWIDTH=79
# export CHROME_EXECUTABLE=/usr/bin/chromium
# export MANPAGER="nvim -c 'set ft=man nu rnu nowrap hlsearch colorcolumn=79'"

alias vvifm='/home/anupam/.config/vifm/scripts/vifmrun'
alias l="exa -lagF --color=always --group-directories-first"
alias ll="l | less -r"
alias b=tmux_opener.sh
# alias s=start_bookmarks
# alias c="pwd | xclip -sel clip"
alias ec="editconf"
#alias tn="tmux new -s"
#alias tl="tmux list-sessions"
#alias tk="tmux kill-session -t"
alias yy720="/home/anupam/scripts/ydlp.sh 136"
alias yymax="/home/anupam/scripts/ydlp.sh bestvideo"
alias yym="/home/anupam/scripts/ydlp.sh"
alias randomwallpaper="/home/anupam/work/build/styli.sh/styli.sh"
#  alias dlfile="/home/anupam/scripts/dlfile"
# alias v=nvim
alias vim=nvim
alias dra=dragon-drop
alias alarm="mpv /home/anupam/Documents/emergency_alarm.wav"
alias alertsound="mpv /home/anupam/Documents/bell-notify.wav"
alias pom="countdown 1500 && alarm"
alias sob="countdown 300 && alarm"
alias lob="countdown 600 && alarm"
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'
alias liveaudio='mpv --ytdl-format=91 --vid=no'
# alias finso='flatpak run rest.insomnia.Insomnia'
# alias nvmsrc="source /usr/share/nvm/init-nvm.sh"
# alias cht="/home/anupam/scripts/cht.sh"
alias sxiv=nsxiv
alias tl="tmux ls"
alias ta="tmux attach"
alias o=xdg-open
alias em="emacsclient -c"
alias egrep="grep -E"

# unset DEBUGINFOD_URLS

# something to display
# figlet 'mark52s' -f mini | lolcat
# colorscript -r
# neofetch
# pfetch
# figlet 'mark52s'
# figlet 'start' | lolcat
# fortune

tt() {
    fileName=`ls -a1 ~/Templates | fzf`
    cp ~/Templates/${fileName} .
}

export SHELL=zsh
