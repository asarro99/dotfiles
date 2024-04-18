echo -e "${GREEN}"
figlet "Preparation"
echo -e "${NONE}"

if [ -d ~/.config ]; then
    echo ":: $HOME/.config folder already exists."
else
    mkdir ~/.config
    echo ":: $HOME/.config folder created."
fi
echo