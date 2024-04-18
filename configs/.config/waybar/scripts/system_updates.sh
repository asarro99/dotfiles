#!/bin/bash

# Check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

aur=$(yay -Qua | wc -l)
ofc=$(checkupdates | wc -l)

# Calculate total available updates
upd=$(( ofc + aur ))

# Show tooltip
if [ $upd -eq 0 ] ; then
    printf "{\"text\":\"%d\", \"tooltip\":\" Packages are up to date\"}" "$upd"
else
    printf "{\"text\":\"%d\", \"tooltip\":\"󱓽 Official %d%s󱓾 AUR %d \"}" "$upd" "$ofc" "\n" "$aur"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    kitty --title systemupdate sh -c "yay -Syu"
fi