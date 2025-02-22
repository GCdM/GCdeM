#!/bin/bash

set -e
set -o pipefail

echo "=== =================================== ==="
echo " 󰔟  .. 󱠦 . 󱠦 . 󱠦 .. EWW .. 󱠦 . 󱠦 . 󱠦 ..  󰔟 "
echo "=== =================================== ==="
echo ""

echo "󱠦  󰔟 [ EWW ] - Installing EWW widgets..."

PACKAGES=(
	eww
	# Packages needed for `workspaces_widget`
	jq
	socat
)

CURRENT_DIRECTORY="$(dirname "$(realpath "$0")")"

"$CURRENT_DIRECTORY/utilities/install-packages.sh" "${PACKAGES[@]}" --icon "󱠦"

echo "󱠦   [ EWW ] - EWW packages installed!"

echo "󱠦 󰒓 󰔟 [ EWW ] - EWW is being configured..."
"$CURRENT_DIRECTORY/utilities/symlink-home-file.sh" ".config/eww" --icon "󱠦"
echo "󱠦 󰒓 󱍸 [ EWW ] - EWW is configured!"

echo "=== =================================== ==="
echo "   .. 󱠦 . 󱠦 . 󱠦 .. EWW .. 󱠦 . 󱠦 . 󱠦 ..   "
echo "=== =================================== ==="
echo ""
