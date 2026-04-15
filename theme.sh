#!/usr/bin/env bash

THEME_DIR=$HOME/.config/themes
THEME=$(ls $THEME_DIR | rofi -dmenu)

#return if rofi is closed
if [ -z $THEME ]; then
	exit 0
fi

if [ ! -d $THEME_DIR/$THEME/colors-wallpaper ]; then
	mkdir $THEME_DIR/$THEME/colors-wallpaper
fi


source $THEME_DIR/$THEME/settings.sh

declare -A overrides=(
	[nvim]="$HOME/.config/nvim/lua/plugins"
	[gtk]="$HOME/.themes"
	[wallpaper]="$HOME/.config"
)

for i in $(ls $THEME_DIR/$THEME); do
	if [ $(echo $i | awk -F'-' '{print $1}') != "colors" ]; then
		continue
	fi

	program=$(echo $i | awk -F'.' '{print substr($1, 8)}')
	echo "$program"
	dir="$HOME/.config/$program"
	if [[ -v overrides[$program] ]]; then
		dir="${overrides[$program]}"
	fi
	echo "$THEME_DIR/$THEME/$i"
	ln -sfn "$THEME_DIR/$THEME/$i" "$dir/$i"
done

#config
killall -SIGUSR2 waybar &

hyprctl keyword source ~/.config/hypr/recolor.conf &

killall swaybg
swaybg -i ~/.config/colors-wallpaper/* -m fill &

gsettings set org.gnome.desktop.interface gtk-theme default
gsettings set org.gnome.desktop.interface gtk-theme colors-gtk
gsettings set org.gnome.desktop.interface color-scheme "$theme_is_dark"
