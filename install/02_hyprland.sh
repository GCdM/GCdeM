#!/bin/bash

set -e
set -o pipefail

echo "=== ======================================== ==="
echo " 󰔟  ..  .  .  .. Hyprland ..  .  .  ..  󰔟 "
echo "=== ======================================== ==="
echo ""

echo "  󰔟 [ Hyprland WM ] - Installing Hyprland + ecosystem packages..."

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
	playerctl                                                       # Utility for media player controls (MPRIS)
	wl-clipboard                                                    # Clipboard support

	mesa         # OpenGL support
	vulkan-intel # Vulkan support for Intel (modify for AMD/NVIDIA if needed)
)

CURRENT_DIRECTORY="$(dirname "$(realpath "$0")")"

"$CURRENT_DIRECTORY/utilities/install-packages.sh" "${PACKAGES[@]}" --icon ""

echo "   [ Hyprland WM ] - Hyprland + ecosystem packages installed!"

echo "  󰔟 [ Hyprland WM ] - Hyprland is being configured..."
"$CURRENT_DIRECTORY/utilities/symlink-home-file.sh" ".config/hypr" --icon ""
echo "   [ Hyprland WM ] - Hyprland is configured!"

# # Enable services
# echo " 󱩎 󰔟 Essential systemctl services - enabling..."
# systemctl enable --now <unit>
# echo " 󱩎  Essential systemctl services - enabled!"

# TODOs
# - configure dunst
# - OR replace w/ swaync

echo "=== ======================================== ==="
echo "   ..  .  .  .. Hyprland ..  .  .  ..   "
echo "=== ======================================== ==="
echo ""
