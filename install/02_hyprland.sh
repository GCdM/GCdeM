#!/bin/bash

set -e
set -o pipefail

echo "=== ======================================== ==="
echo " 󰔟  ..  .  .  .. Hyprland ..  .  .  ..  󰔟 "
echo "=== ======================================== ==="
echo ""

# # Ensure the script is run as root
# if [[ $EUID -ne 0 ]]; then
# 	echo "This script must be run as root."
# 	exit 1
# fi

# # Update system and install required packages
# echo "Updating system and installing essential tools..."
# pacman -Syu --noconfirm
# pacman -S --noconfirm base-devel git wget curl unzip

# Install Hyprland and related components
echo "  󰔟 Installing Hyprland + ecosystem..."
PACKAGES=(
	hyprland
	hyprpaper
	hypridle
	hyprlock
	xdg-desktop-portal-hyprland
	polkit-kde-agent # TODO swap for hyprpolkitagent?
	hyprlang
	hyprwayland-scanner
	qt5-wayland
	qt6-wayland

	# # Other hypr ecosystem tools that I _might_ care about:
	# hyprsunset        # Bluelight filter
	# hyprpolkitagent   # polkit-kde-agent replacement
	# hyprcursor        # Cursor theme
	# hyprutils         # "Shared implementation of common [stuff] across hypr ecosystem"
	# hyprgraphics      # " ^^^ " but for graphics [stuff]
	# hyprland-qtutils  # Utility applications like dialogs or popups

	dunst libnotify                                                 # Notifications
	pipewire wireplumber pipewire-alsa pipewire-jack pipewire-pulse # Audio support
	grim slurp                                                      # For screenshots
	wl-clipboard                                                    # Clipboard support

	# Extras
	noto-fonts         # Basic fonts
	noto-fonts-emoji   # Emoji fonts
	ttf-jetbrains-mono # JetBrains Mono for terminal fonts
	mesa               # OpenGL support
	vulkan-intel       # Vulkan support for Intel (modify for AMD/NVIDIA if needed)
)

pacman -S --noconfirm "${PACKAGES[@]}"

HYPR_CONFIG_DIR="$HOME/.config/hypr"
# TODO soft link configuration files

# Enable services (optional, depending on use case)
echo " 󱩎 󰔟 Essential systemctl services - enabling..."
systemctl enable --now dbus
systemctl enable --now pipewire
systemctl enable --now wireplumber
echo " 󱩎  Essential systemctl services - enabled!"

# TODOs
# - configure dunst
# - learn + set up grim screenshot tool (+ slurp?)

echo "=== ======================================== ==="
echo "   ..  .  .  .. Hyprland ..  .  .  ..   "
echo "=== ======================================== ==="
echo ""
