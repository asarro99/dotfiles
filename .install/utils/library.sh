#!/bin/bash

install_packages_pacman() {
    local packages_to_install=()

    for package in "$@"; do
        if ! command -v pacman >/dev/null 2>&1; then
            echo "pacman is not installed"
            return 1
        fi
        if pacman -Qq "$package" >/dev/null 2>&1; then
            echo "$package is already installed"
            continue
        fi
        packages_to_install+=("$package")
    done

    if [ ${#packages_to_install[@]} -gt 0 ]; then
        sudo pacman -S --noconfirm "${packages_to_install[@]}"
    fi
}

install_packages_paru() {
    local packages_to_install=()

    for package in "$@"; do
        if ! command -v pacman >/dev/null 2>&1; then
            echo "pacman is not installed"
            return 1
        fi
        if pacman -Qq "$package" >/dev/null 2>&1; then
            echo "$package is already installed"
            continue
        fi
        packages_to_install+=("$package")
    done

    if [ ${#packages_to_install[@]} -gt 0 ]; then
        sudo pacman -S --noconfirm "${packages_to_install[@]}"
    fi
}

install_symlink() {
  symlink="$1"
  linksource="$2"
  linktarget="$3"

  # Check if symlink already exists and remove it if it's a file or directory
  if [[ -e "$symlink" ]]; then
    rm -rf "$symlink"
  fi

  # Create the symlink
  ln -s "$linksource" "$linktarget"

  # Print informative message based on the type of symlink created
  if [[ -f "$linksource" ]]; then
    echo ":: Symlink to file $linksource -> $linktarget created."
  elif [[ -d "$linksource" ]]; then
    echo ":: Symlink for directory $linksource -> $linktarget created."
  else
    echo ":: New symlink $linksource -> $linktarget created."
  fi
}