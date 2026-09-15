#!/usr/bin/env bash

# first arg is project folder
# second arg is file
# third arg is line

# process args
termrun="alacritty -e "
project="$1"
sock_pre="/tmp/nvim-socks"
sock="$sock_pre/$(basename "$project")"
file="$2"
line="$3"

# open and own folder if it doesn not exist
[ -d "$sock_pre" ] || mkdir -p "$sock_pre"
[ -O "$sock_pre" ] || chown $USER:$USER "$sock_pre"


# listen on new socket if none exists
if [ -S "$sock" ]; then
	nvim --server "$sock" --remote-tab "$file"
	nvim --server "$sock" --remote-send '<C-\><C-N>:'"$line"'<CR>'
else
	$termrun nvim --listen "$sock" "$file" +"$line"
fi
