#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
	echo "params: bg, fg, subtle, accent, error"
	exit 1
fi

newline=$'\n'

## waybar
waybarcolors="
@define-color bg #\$1;$newline
@define-color fg #$2;$newline
@define-color subtle #$3;$newline
@define-color accent #$4;$newline
@define-color error #$5;"

rivercolors="
#!/usr/bin/env bash
color_bg=\"0x$1\"$newline
color_fg=\"0x$2\"$newline
color_subtle=\"0x$3\"$newline
color_accent=\"0x$4\"$newline
color_error=\"0x$5\""

echo $waybarcolors > colors-waybar.css
echo $rivercolors > colors-river.sh
