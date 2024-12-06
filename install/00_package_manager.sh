#!/bin/bash

set -e

echo "=== =============================================== ==="
echo " 󰔟  .. 󰣇 . 󰣇 . 󰣇 .. Package manager .. 󰣇 . 󰣇 . 󰣇 ..  󰔟 "
echo "=== =============================================== ==="
echo ""

required_env_vars=("PACKAGE_MANAGER")
current_directory="$(dirname "$(realpath "$0")")"
"$current_directory/utils/check-variables-are-set.sh" "${required_env_vars[@]}"

if command -v "$PACKAGE_MANAGER" &>/dev/null; then
	echo "󰣇   $PACKAGE_MANAGER is already installed."
else
	read -pr "󰣇  󰆆 Do you want to install $PACKAGE_MANAGER? (y/n): " answer

	case $answer in
	[Yy]*)
		case $PACKAGE_MANAGER in
		paru)
			echo "󰣇  󰔟 paru is being installed..."

			# Make temporary directory to make paru from source
			mkdir -p "$HOME/TemporaryParuDirectory"
			cd "$HOME/TemporaryParuDirectory"
			sudo pacman -S --needed base-devel
			git clone https://aur.archlinux.org/paru.git
			cd paru
			makepkg -si
			cd current_directory

			echo "󰣇   paru is installed!"
			;;
		*)
			# Missing installation method for PACKAGE_MANAGER
			echo "󰣇   Missing installation method for $PACKAGE_MANAGER package manager."

			exit 1
			;;
		esac
		;;
	*)
		echo "󰣇  󰒬 Skipping $PACKAGE_MANAGER installation."
		;;
	esac
fi

# Enable parallel downloads in pacman.conf
if [[ -f /etc/pacman.conf ]]; then
	number_of_parallel_downloads="10"
	echo "󰣇 󰒓 󰔟 Enabling parallel downloads in Pacman..."
	sudo sed -i "s/^#*\(ParallelDownloads\)=.*/\1=$number_of_parallel_downloads/" /etc/pacman.conf
	echo "󰣇 󰒓  Parallel downloads have been set to $number_of_parallel_downloads."
else
	echo "󰣇 󰒓  Missing pacman config"
	exit 1
fi

echo ""
echo "=== =============================================== ==="
echo "   .. 󰣇 . 󰣇 . 󰣇 .. Package manager .. 󰣇 . 󰣇 . 󰣇 ..   "
echo "=== =============================================== ==="
echo ""
