#!/bin/bash

set -e

echo "=== =============================================== ==="
echo " 󰣇  .. 󰔟 . 󰔟 . 󰔟 .. Package manager .. 󰔟 . 󰔟 . 󰔟 ..  󰣇 "
echo "=== =============================================== ==="
echo ""

required_env_vars=("PACKAGE_MANAGER")
current_directory="$(dirname "$(realpath "$0")")"
"$current_directory/utils/check-variables-are-set.sh" "${required_env_vars[@]}"

if command -v "$PACKAGE_MANAGER" &>/dev/null; then
	echo "󰣇   [ Install package manager ] - Package manager $PACKAGE_MANAGER is already installed."
else
	read -pr "󰣇  󰆆 Do you want to install $PACKAGE_MANAGER? (y/n): " answer

	case $answer in
	[Yy]*)
		case $PACKAGE_MANAGER in
		paru)
			echo "󰣇  󰔟 [ Install package manager ] - paru is being installed..."

			# Make temporary directory to make paru from source
			mkdir -p "$HOME/TemporaryParuDirectory"
			cd "$HOME/TemporaryParuDirectory"
			sudo pacman -S --needed base-devel
			git clone https://aur.archlinux.org/paru.git
			cd paru
			makepkg -si
			cd current_directory

			# TODO investigate whether installing `bat` give correct syntax highlighting

			echo "󰣇   [ Install package manager ] - paru is installed!"
			;;
		*)
			# Missing installation method for PACKAGE_MANAGER
			echo "󰣇   [ Install package manager ] - Missing installation method for $PACKAGE_MANAGER package manager."

			exit 1
			;;
		esac
		;;
	*)
		echo "󰣇  󰒬 [ Install package manager ] - Skipping $PACKAGE_MANAGER installation."
		;;
	esac
fi

# Enable parallel downloads in pacman.conf
if [[ -f /etc/pacman.conf ]]; then
	number_of_parallel_downloads="10"
	if grep -qE "^\s*ParallelDownloads\s*=\s*$number_of_parallel_downloads\b" /etc/pacman.conf; then
		echo "󰣇 󰒓  [ Install package manager ] - Parallel downloads are already set to $number_of_parallel_downloads."
	else
		echo "󰣇 󰒓 󰔟 [ Install package manager ] - Enabling parallel downloads in Pacman..."
		sudo sed -i "s/^#*\(ParallelDownloads\)=.*/\1=$number_of_parallel_downloads/" /etc/pacman.conf
		echo "󰣇 󰒓  [ Install package manager ] - Parallel downloads have been set to $number_of_parallel_downloads!"
	fi
else
	echo "󰣇 󰒓  [ Install package manager ] - Missing pacman config: /etc/pacman.conf"
	exit 1
fi

echo ""
echo "=== =============================================== ==="
echo " 󰣇  ..  .  .  .. Package manager ..  .  .  ..  󰣇 "
echo "=== =============================================== ==="
echo ""
