#!/bin/bash

function notify_vol
{
    vol=$(pamixer "$srce" --get-volume | cat)
    angle="$(( ((vol+2)/5) * 5 ))"
    ico="${icon_dir}/vol-${angle}.svg"
    bar=$(seq -s "." $((vol / 15)) | sed 's/[0-9]//g')
    dunstify "t2" -a "$vol$bar" "$nsink" -i "$ico" -r 91190 -t 800
}

function notify_mute
{
    mute=$(pamixer "$srce" --get-mute | cat)
    if [ "$mute" == "true" ] ; then
        dunstify "t2" -a "muted" "$nsink" -i "${icon_dir}"/muted-"${dvce}".svg -r 91190 -t 800
    else
        dunstify "t2" -a "unmuted" "$nsink" -i "${icon_dir}"/unmuted-"${dvce}".svg -r 91190 -t 800
    fi
}

while getopts io SetSrc
do
    case $SetSrc in
    i) nsink=$(pamixer --list-sources | grep "_input." | head -1 | awk -F '" "' '{print $NF}' | sed 's/"//')
        srce="--default-source"
        dvce="mic" ;;
    o) nsink=$(pamixer --get-default-sink | grep "_output." | awk -F '" "' '{print $NF}' | sed 's/"//')
        srce=""
        dvce="speaker" ;;
    *) ;;
    esac
done

shift $((OPTIND -1))
step="${2:-5}"
icon_dir="$HOME/.config/dunst/icons/vol"

case $1 in
    i) pamixer "$srce" -i "${step}"
        notify_vol ;;
    d) pamixer "$srce" -d "${step}"
        notify_vol ;;
    m) pamixer "$srce" -t
        notify_mute ;;
    *) print_error ;;
esac
