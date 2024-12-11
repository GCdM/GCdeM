#!/bin/bash

set -e

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

# Set environment variables to be used across install sub-scripts
export GCDEM_PATH="$HOME/GCdeM/"
export PACKAGE_MANAGER="paru"
export TERMINAL="alacritty"

# # Update system and install required packages
# echo "Updating system and installing essential tools..."
# pacman -Syu --noconfirm
# pacman -S --noconfirm base-devel git wget curl unzip

current_directory="$(dirname "$(realpath "$0")")"

# Install package manager
"$current_directory/install/00_package-manager.sh"

# Set up terminal & shell
"$current_directory/install/01_git.sh"

# Set up Hyprland
"$current_directory/install/02_hyprland.sh"

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
