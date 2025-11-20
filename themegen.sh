#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
	echo "params: bg, fg, subtle, accent, error"
	exit 1
fi

## waybar
printf '@define-color bg #%q;\n@define-color fg #%q;\n@define-color subtle #%q;\n@define-color accent #%q;\n@define-color error #%q;' $1 $2 $3 $4 $5 > colors-waybar.css

printf '#!/usr/bin/env bash\ncolor_bg="0x$1"\ncolor_fg="0x$2"\ncolor_subtle="0x$3"\ncolor_accent="0x$4"\ncolor_error="0x$5"' $1 $2 $3 $4 $5 > colors-river.sh
