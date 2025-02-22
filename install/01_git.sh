#!/bin/bash

set -e

echo "=== =================================== ==="
echo " 󰔟  ..  .  .  .. Git ..  .  .  ..  󰔟 "
echo "=== =================================== ==="
echo ""

if command -v "git" &>/dev/null; then
	echo "   [ Install git ] - git is already installed."
else
	echo "  󰔟 [ Install git ] - git is being installed..."
	$PACKAGE_MANAGER -S git

	echo "   [ Install git ] - git installed!"
fi

echo " 󰒓 󰔟 [ Install git ] - git is being configured..."

CURRENT_DIRECTORY="$(dirname "$(realpath "$0")")"
"$CURRENT_DIRECTORY/utilities/symlink-home-file.sh" ".gitconfig" --icon ""

echo " 󰒓 󱍸 [ Install git ] - git is configured!"

echo ""
echo "=== ==================================== ==="
echo "   ..  .  .  .. Git  ..  .  .  ..   "
echo "=== ==================================== ==="
echo ""
