#!/bin/bash

set -e
set -o pipefail

echo "=== ======================================== ==="
echo " 󰔟  ..  .  .  .. Hyprland ..  .  .  ..  󰔟 "
echo "=== ======================================== ==="
echo ""

echo "  󰔟 Hyprland + ecosystem - installing..."

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

	mesa         # OpenGL support
	vulkan-intel # Vulkan support for Intel (modify for AMD/NVIDIA if needed)
)

$PACKAGE_MANAGER -S --noconfirm "${PACKAGES[@]}"
echo "   Hyprland + ecosystem - installed!"

echo "  󰔟 Hyprland config - syncing..."

ln -s "$GCDEM_PATH/config/hypr/" "$HOME/.config/hypr/"

echo "   Hyprland config - synced!"

# # Enable services
# echo " 󱩎 󰔟 Essential systemctl services - enabling..."
# systemctl enable --now <unit>
# echo " 󱩎  Essential systemctl services - enabled!"

# TODOs
# - configure dunst
# - learn + set up grim screenshot tool (+ slurp?)

echo "=== ======================================== ==="
echo "   ..  .  .  .. Hyprland ..  .  .  ..   "
echo "=== ======================================== ==="
echo ""
