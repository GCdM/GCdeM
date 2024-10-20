#!/bin/bash

# Use paru unless $PACKAGE_MANAGER is set
package_manager="${PACKAGE_MANAGER:-paru}"

# Check if the package_manager is already installed
if command -v "$package_manager" &>/dev/null; then
  echo "⏭️ $package_manager is already installed."
else
  read -p ":questionmark: Do you want to install $package_manager? (y/n): " answer

  case $answer in
  [Yy]*)
    echo ":sandtimer: Installing $package_manager..."

    sudo $package_manager -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    ;;
  *)
    echo ":cross: Exiting without installing."
    ;;
  esac
fi
