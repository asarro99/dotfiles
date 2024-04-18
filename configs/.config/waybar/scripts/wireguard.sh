#!/bin/bash

CONF_NAME="home"
STATUS_CONNECTED_STR='{"text":"","class":"connected","alt":"connected"}'
STATUS_DISCONNECTED_STR='{"text":"","class":"disconnected","alt":"disconnected"}'

function ask_password() {
    rofi -dmenu -password -no-fixed-num-lines -p "Password: " -theme "~/.config/rofi/password.rasi"
}

function get_status() {
    SUDO_ASKPASS=~/.config/waybar/scripts/wireguard.sh sudo -A wg show "$CONF_NAME" | grep -c "peer"
}

function toggle_wireguard() {
    (get_status && \
        SUDO_ASKPASS=~/.config/waybar/scripts/wireguard.sh sudo -A  wg-quick down $CONF_NAME) || \
        SUDO_ASKPASS=~/.config/waybar/scripts/wireguard.sh sudo -A  wg-quick up $CONF_NAME
}

case $1 in
    -s | --status)
        if [ "$(get_status)" -eq 0 ]; then
            echo "$STATUS_DISCONNECTED_STR"
        else
            echo "$STATUS_CONNECTED_STR"
        fi
        ;;
    -t | --toggle)
        toggle_wireguard
        ;;
    *)
        ask_password
        ;;
esac