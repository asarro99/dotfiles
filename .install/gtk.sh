echo -e "${GREEN}"
figlet "Gtk"
echo -e "${NONE}"

SCRIPT=$(realpath "$0")
path=$(dirname "$SCRIPT")

if [ -e $path/configs/.config/gtk-3.0 ]; then
    install_symlink ~/.config/gtk-3.0 $path/configs/.config/gtk-3.0 ~/.config
fi

if [ -e $path/configs/.config/gtk-4.0 ]; then
    install_symlink ~/.config/gtk-4.0 $path/configs/.config/gtk-4.0 ~/.config
fi

if [ -e $path/configs/.gtkrc-2.0 ]; then
    install_symlink ~/.gtkrc-2.0 $path/configs/.gtkrc-2.0 ~/
fi

if [ -e $path/configs/.Xresources ]; then
    install_symlink ~/.Xresources $path/configs/.Xresources ~/
fi

if [ -e $path/configs/.config/xsettingsd ]; then
    install_symlink ~/.config/xsettingsd $path/configs/.config/xsettingsd ~/.config
fi