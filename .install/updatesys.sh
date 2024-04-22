echo -e "${GREEN}"
figlet "System Update"
echo -e "${NONE}"

if gum confirm "Do you want to update your system with yay?" ;then
    echo ":: Update started"
    yay
elif [ $? -eq 130 ]; then
    exit 130
else    
    echo ":: System update skipped"
fi
echo