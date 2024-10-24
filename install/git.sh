#!/bin/bash

set -e

echo "=== =================================== ==="
echo " 󰔟  ..  .  .  .. Git ..  .  .  ..  󰔟 "
echo "=== =================================== ==="
echo ""

required_env_vars=("")
current_directory="$(dirname "$(realpath "$0")")"
"$current_directory/utils/check-variables-are-set.sh" "${required_env_vars[@]}"

if command -v "git" &>/dev/null; then
	echo "   git is already installed."
else
	echo "  󰔟 git is being installed..."
	$ -S git

	echo "   git installed!"
fi

echo " 󰒓 󰔟 git is being configured..."
# Change it to copy existing config file
git config --global user.name "GCdM"
git config --global user.email "59828466+GCdM@users.noreply.github.com"

echo " 󰒓 󱍸 git is configured!"

echo ""
echo "=== ==================================== ==="
echo "   ..  .  .  .. Git  ..  .  .  ..   "
echo "=== ==================================== ==="
echo ""
