#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
	echo "params: bg, fg, subtle, accent, error"
	exit 1
fi

## waybar
waybarcolors="
@define-color bg #$1;\n
@define-color fg #$2;\n
@define-color subtle #$3;\n
@define-color accent #$4;\n
@define-color error #$5;"

rivercolors="
#!/usr/bin/env bash
color_bg=\"0x$1\"\n
color_fg=\"0x$2\"\n
color_subtle=\"0x$3\"\n
color_accent=\"0x$4\"\n
color_error=\"0x$5\""

echo $waybarcolors > colors-waybar.css
echo $rivercolors > colors-river.sh
