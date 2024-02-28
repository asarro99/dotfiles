#!/bin/bash

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown='󰐥'
reboot='󰑓'
lock=''
suspend=''
logout='󰍃'
yes='Y'
no='N'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme "/home/ohhbigg/Projects/dotfiles/configs/rofi/powermenu.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "/home/ohhbigg/Projects/dotfiles/configs/rofi/powermenu.rasi"
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "$shutdown")
		sleep 1; systemctl poweroff;
        ;;
    "$reboot")
		sleep 1; systemctl reboot;
        ;;
    "$lock")
		sleep 1; hyprlock;
        ;;
    "$suspend")
		sleep 1; systemctl suspend;
        ;;
    "$logout")
		echo ""
        ;;
esac