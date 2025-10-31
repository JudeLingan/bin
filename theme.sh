#!/usr/bin/env bash

THEME_DIR=$HOME/.config/themes
THEME=$(ls $THEME_DIR | rofi -dmenu)

#return if rofi is closed
if [ -z $THEME ]; then
	exit 0
fi

programs=(
	"rofi"
	"alacritty"
	"waybar"
	"river"
)
for i in "${programs[@]}"; do
	ln -f $THEME_DIR/$THEME/colors-$i.* $HOME/.config/$i/
done

ln -f $THEME_DIR/$THEME/colors-nvim.lua $HOME/.config/nvim/lua/plugins
ln -sf $THEME_DIR/$THEME/colors-gtk $HOME/.themes

pkill waybar
riverctl spawn waybar

source $HOME/.config/river/colors-river.sh
riverctl background-color $color_accent
riverctl border-color-focused $color_fg
riverctl border-color-unfocused $color_subtle

gsettings set org.gnome.desktop.interface gtk-theme default
gsettings set org.gnome.desktop.interface gtk-theme colors-gtk
