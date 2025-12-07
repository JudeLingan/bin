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

programs=(
	"rofi"
	"alacritty"
	"waybar"
	"river"
)

for i in "${programs[@]}"; do
	ln -f $THEME_DIR/$THEME/colors-$i.* $HOME/.config/$i/
done

#programs not directly in config folder
ln -f $THEME_DIR/$THEME/colors-nvim.lua $HOME/.config/nvim/lua/plugins
ln -sf $THEME_DIR/$THEME/colors-gtk $HOME/.themes
ln -sf $THEME_DIR/$THEME/colors-wallpaper $HOME/.config

#config
killall -SIGUSR2 waybar

source $HOME/.config/river/colors-river.sh
riverctl background-color $color_accent
riverctl border-color-focused $color_fg
riverctl border-color-unfocused $color_subtle

gsettings set org.gnome.desktop.interface gtk-theme default
gsettings set org.gnome.desktop.interface gtk-theme colors-gtk
gsettings set org.gnome.desktop.interface color-scheme "$theme_is_dark"

killall swaybg
swaybg -i ~/.config/colors-wallpaper/* -m fill & disown
