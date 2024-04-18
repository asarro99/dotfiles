echo -e "${GREEN}"
figlet "System Update"
echo -e "${NONE}"

if gum confirm "Do you want to update your system with paru?" ;then
    echo ":: Update started"
    paru
elif [ $? -eq 130 ]; then
    exit 130
else    
    echo ":: System update skipped"
fi
echo