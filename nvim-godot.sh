#!/usr/bin/env bash

# first arg is project folder
# the rest is commands to be passed to the server

# process args
termrun="alacritty -e "
project="$1"
sock_pre="/tmp/nvim-socks"
sock="$sock_pre/$(basename "$project")"
args="${@:2}"

# open and own folder if it doesn not exist
[ -d "$sock_pre" ] || mkdir -p "$sock_pre"
[ -O "$sock_pre" ] || chown $USER:$USER "$sock_pre"


# listen on new socket if none exists
if [ -S "$sock" ]; then
	nvim --server "$sock" --remote "${args[@]}"
else
	$termrun nvim --listen "$sock" "${args[@]}"
fi
