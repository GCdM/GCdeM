#!/bin/bash

set -e

echo ''
echo '=== ======================================================================= ==='
echo '=== ======================================================================= ==='
echo '===       ___           ___          _____          ___           ___       ==='
echo '===      /  /\         /  /\        /  /::\        /  /\         /__/\      ==='
echo '===     /  /:/_       /  /:/       /  /:/\:\      /  /:/_       |  |::\     ==='
echo '===    /  /:/ /\     /  /:/       /  /:/  \:\    /  /:/ /\      |  |:|:\    ==='
echo '===   /  /:/_/::\   /  /:/  ___  /__/:/ \__\:|  /  /:/ /:/_   __|__|:|\:\   ==='
echo '===  /__/:/__\/\:\ /__/:/  /  /\ \  \:\ /  /:/ /__/:/ /:/ /\ /__/::::| \:\  ==='
echo '===  \  \:\ /~~/:/ \  \:\ /  /:/  \  \:\  /:/  \  \:\/:/ /:/ \  \:\~~\__\/  ==='
echo '===   \  \:\  /:/   \  \:\  /:/    \  \:\/:/    \  \::/ /:/   \  \:\        ==='
echo '===    \  \:\/:/     \  \:\/:/      \  \::/      \  \:\/:/     \  \:\       ==='
echo '===     \  \::/       \  \::/        \__\/        \  \::/       \  \:\      ==='
echo '===      \__\/         \__\/                       \__\/         \__\/      ==='
echo '===                                                                         ==='
echo '=== ======================================================================= ==='
echo '=== ======================================================================= ==='
echo ''

handle_error() {
	echo "Could not complete installationg </3"
	echo "An error occurred :( at line $1"
	echo ""
	exit 1
}

trap 'handle_error $LINENO' ERR

# Set environment variables to be used across install sub-scripts
GCDEM_PATH="$(dirname "$(realpath "$0")")"
export GCDEM_PATH

PACKAGE_MANAGER=$(./install/utililities/prompt-select.sh "Which package manager would you like to use?" "paru")
export PACKAGE_MANAGER

TERMINAL=$(./install/utililities/prompt-select.sh "What terminal would you like to set as your main terminal?" "alacritty")
export TERMINAL

# # Update system and install required packages
# echo "Updating system and installing essential tools..."
# pacman -Syu --noconfirm
# pacman -S --noconfirm base-devel git wget curl unzip

# Install package manager
"$GCDEM_PATH/install/00_package-manager.sh"

# Set up terminal & shell
"$GCDEM_PATH/install/01_git.sh"

# Set up Hyprland
"$GCDEM_PATH/install/02_hyprland.sh"

# TODO copy all `stdout` + `stderr` to a .gitignored file or directory, so that
# it's auditable in case the terminal is cleared/closed or the computer rebooted

# read -pr "Would you like to reboot system? (y/N): " REBOOT
# if [[ $REBOOT =~ ^[Yy]$ ]]; then
# 	reboot
# fi

# # Set environment variables to be used across install sub-scripts
# fish -c "set -Ux GCDEM_PATH $HOME/GCdeM"
# fish -c "set -Ux PACKAGE_MANAGER paru"
# fish -c "set -Ux TERMINAL alacritty"
#
# # Set general env vars
# fish -c "set -Ux VISUAL nvim"

# Setup snapper + btrfs-grub

# Config github (+ SSH)

# # Hyprland utilities
# - hyprpaper
# - pipewire
# - brightnessctl
# - xdg-wayland-portal
# - polkit? or hyprpolkit
# - wl-clipboard
# - nautilus
# - decrease key repeat delay/rate

# # IDE + dev tools
# - npm
# - clang
# - ripgrep
# - git
# - neovim
# - lazygit
# - fd

# # Notification system
# - dunst
# - -- styling

# # Betterfox
#
#
