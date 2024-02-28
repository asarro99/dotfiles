# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

source .install/library.sh

if [ -d ~/Projects/dotfiles/configs/kitty ]; then
     _installSymLink kitty ~/.config/kitty ~/Projects/dotfiles/configs/kitty ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/nvim ]; then
     _installSymLink nvim ~/.config/nvim ~/Projects/dotfiles/configs/nvim ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/rofi ]; then
     _installSymLink rofi ~/.config/rofi ~/Projects/dotfiles/configs/rofi ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/dunst ]; then
     _installSymLink dunst ~/.config/dunst ~/Projects/dotfiles/configs/dunst ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/hypr ]; then
     _installSymLink hypr ~/.config/hypr ~/Projects/dotfiles/configs/hypr ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/waybar ]; then
     _installSymLink waybar ~/.config/waybar ~/Projects/dotfiles/configs/waybar ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/wlogout ]; then
     _installSymLink wlogout ~/.config/wlogout ~/Projects/dotfiles/configs/wlogout ~/.config
fi

if [ -d ~/Projects/dotfiles/configs/swappy ]; then
     _installSymLink swappy ~/.config/swappy ~/Projects/dotfiles/configs/swappy ~/.config
fi
echo "Symbolic links created."
echo
