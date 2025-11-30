#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
	echo "params: bg, fg, subtle, accent, error"
	exit 1
fi

## waybar
printf '@define-color bg #%q;\n@define-color fg #%q;\n@define-color subtle #%q;\n@define-color accent #%q;\n@define-color error #%q;' $1 $2 $3 $4 $5 > colors-waybar.css

printf '#!/usr/bin/env bash\ncolor_bg="0x%q"\ncolor_fg="0x%q"\ncolor_subtle="0x%q"\ncolor_accent="0x%q"\ncolor_error="0x%q"' %q %q %q %q %q > colors-river.sh
