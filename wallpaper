#!/usr/bin/env bash
WALLPAPER_IMAGE=$(swayimg -c ~/.config/swayimg/wallpaperrc.lua ~/Pictures/wallpaper)

if ! [ -f "$WALLPAPER_IMAGE" ]; then
	exit 1
fi

rm ~/.config/colors-wallpaper/*
cp -t ~/.config/colors-wallpaper/ $WALLPAPER_IMAGE 

killall swaybg
swaybg -i ~/.config/colors-wallpaper/* -m fill > /dev/null & disown
