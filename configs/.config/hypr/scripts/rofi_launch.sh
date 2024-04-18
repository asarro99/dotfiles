#!/bin/bash

case $1 in
    d)  r_mode="drun" 
        r_theme="~/.config/rofi/launcher.rasi" ;;
    w)  r_mode="window" ;;
    f)  r_mode="filebrowser" ;;
    h)  echo -e "rofilaunch.sh [action]\nwhere action,"
        echo "d :  drun mode"
        echo "w :  window mode"
        echo "f :  filebrowser mode,"
        exit 0 ;;
    *)  r_mode="drun" ;;
esac

rofi -show $r_mode -theme "$r_theme"