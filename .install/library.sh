#!/bin/bash

#  __    __  ____  ____   __   ____  _  _ 
# (  )  (  )(  _ \(  _ \ / _\ (  _ \( \/ )
# / (_/\ )(  ) _ ( )   //    \ )   / )  / 
# \____/(__)(____/(__\_)\_/\_/(__\_)(__/  

# -----------------------------------------
# Function: Ask for user confirmation
# -----------------------------------------
_askForConfirmation(){
  while true; do
    read -rp "Do you want to proceed? (YES/NO/CANCEL)" yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      [Cc]* ) exit;;
      * ) echo "Please answer YES, NO, or CANCEL.";;
    esac
  done
}

# ------------------------------------------------------
# Function Install all package if not installed
# ------------------------------------------------------
_installPackagesPacman() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[*]}" == "" ]] ; then
        return;
    fi;

    sudo pacman --noconfirm -S "${toInstall[@]}";
}

# ------------------------------------------------------
# Function: Is package installed
# ------------------------------------------------------
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0;
        return;
    fi;
    echo 1;
    return;
}

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "\." | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0;
        return;
    fi;
    echo 1;
    return;
}

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
_installSymLink() {
    name="$1"
    symlink="$2";
    linksource="$3";
    linktarget="$4";
    
    if [ -L "${symlink}" ]; then
        rm "${symlink}"
        ln -s "${linksource}" "${linktarget}" 
        echo ":: Symlink ${linksource} -> ${linktarget} created."
    else
        if [ -d "${symlink}" ]; then
            rm -rf "${symlink:?}"/ 
            ln -s "${linksource}" "${linktarget}"
            echo ":: Symlink for directory ${linksource} -> ${linktarget} created."
        else
            if [ -f "${symlink}" ]; then
                rm "${symlink}" 
                ln -s "${linksource}" "${linktarget}" 
                echo ":: Symlink to file ${linksource} -> ${linktarget} created."
            else
                ln -s "${linksource}" "${linktarget}" 
                echo ":: New symlink ${linksource} -> ${linktarget} created."
            fi
        fi
    fi
}
