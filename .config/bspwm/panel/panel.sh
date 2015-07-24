#! /bin/bash

. /home/william/.config/bspwm/bspwm_config.sh
/home/william/.config/bspwm/panel/panel_bar.sh \
	| lemonbar -p -g x$BAR_HEIGHT -B $BASE_COLOR -o -1 -u 3\
		-f "DejaVu Sans Mono for Powerline:size=11" \
		-f "Icons:size=11" \
		-f "Ubuntu:size=10" \
	| bash
