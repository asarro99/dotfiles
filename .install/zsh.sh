echo -e "${GREEN}"
figlet "Gtk"
echo -e "${NONE}"

SCRIPT=$(realpath "$0")
path=$(dirname "$SCRIPT")

if [ -e $path/configs/.zshrc ]; then
    install_symlink ~/.zshrc $path/configs/.zshrc ~/
fi

if [ -e $path/configs/.config/zsh ]; then
    install_symlink ~/.config/zsh $path/configs/.config/zsh ~/.config
fi