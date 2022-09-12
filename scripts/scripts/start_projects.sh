#!/bin/sh

ch=`echo "fresh-app" | fzf`

case "$ch" in
	"fresh-app")
		tmux switch-client -t "fresh-app"
		if [[ $? -eq 0 ]]; then
			exit 0
		fi
		tmux attach -t "fresh-app"
		if [[ $? -eq 0 ]]; then
			exit 0
		fi
		dir="/home/anupam/work/playground/web/fresh-app"
		tmux new-session -d -s fresh-app -c $dir
		tmux send-key -t fresh-app nvim ENTER
		tmux new-window -n "run" -c "${dir}/server/main-server"
		tmux send-key -t fresh-app "cargo watch -x run" ENTER
		tmux new-window -n "f-run" -c $dir
		tmux send-key -t fresh-app "deno task start" ENTER
		tmux select-window -t fresh-app:0
		tmux send-key -t fresh-app "^n"
		tmux attach -t fresh-app -c $dir
		;;
esac
