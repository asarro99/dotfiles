#!/bin/bash

# Theme Elements
prompt='Screenshot'
mesg="DIR: $(xdg-user-dir PICTURES)/Screenshots"

list_col='1'
list_row='3'
win_width='400px'

# Options
option_1="󰍹  Capture Desktop"
option_2="  Capture Area"
option_3="  Capture Area (Freeze)"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: " ";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme "/home/ohhbigg/Projects/dotfiles/configs/rofi/screenshot.rasi"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

# Screenshot
time=$(date +%Y-%m-%d-%H-%M-%S)
geometry=$(xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
dir="$(xdg-user-dir PICTURES)/Screenshots"
file="Screenshot_${time}_${geometry}.png"

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		sleep 1 && grimblast copysave screen "$dir/$file" && swappy -f "$dir/$file"
	elif [[ "$1" == '--opt2' ]]; then
		sleep 1 && grimblast copysave area "$dir/$file" && swappy -f "$dir/$file"
	elif [[ "$1" == '--opt3' ]]; then
		sleep 1 && grimblast --freeze copysave area "$dir/$file" && swappy -f "$dir/$file"
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "$option_1")
		run_cmd --opt1
        ;;
    "$option_2")
		run_cmd --opt2
        ;;
    "$option_3")
		run_cmd --opt3
        ;;
esac