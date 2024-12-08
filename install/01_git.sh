#!/bin/bash

set -e

echo "=== =================================== ==="
echo " 󰔟  ..  .  .  .. Git ..  .  .  ..  󰔟 "
echo "=== =================================== ==="
echo ""

if command -v "git" &>/dev/null; then
	echo "   git is already installed."
else
	echo "  󰔟 git is being installed..."
	$PACKAGE_MANAGER -S git

	echo "   git installed!"
fi

echo " 󰒓 󰔟 git is being configured..."

# TODO Change it to copy existing config file
git config --global user.name "GCdM"
git config --global user.email "59828466+GCdM@users.noreply.github.com"
git config --global init.defaultBranch "main"

echo " 󰒓 󱍸 git is configured!"

echo ""
echo "=== ==================================== ==="
echo "   ..  .  .  .. Git  ..  .  .  ..   "
echo "=== ==================================== ==="
echo ""
