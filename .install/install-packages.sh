echo "Install general purpose packages...."
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";
echo "Done!"
echo ""