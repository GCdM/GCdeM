#!/bin/bash

set -e

TO_INSTALL=()
ALREADY_INSTALLED=()
ICON="󰏗"

# Parse arguments
while [[ $# -gt 0 ]]; do
	if [[ "$1" = '--icon' ]]; then
		ICON="$2"
		shift 2
		continue
	fi

	pkg="$1"
	if ! $PACKAGE_MANAGER -Q "${pkg}" &>/dev/null; then
		TO_INSTALL+=("${pkg}")
	else
		ALREADY_INSTALLED+=("${pkg}")
	fi

	shift 1
done

if [ "${#ALREADY_INSTALLED[@]}" -gt 0 ]; then
	echo "$ICON  󰍉 [ Install packages ] - Packages already installed: ${ALREADY_INSTALLED[*]}."
fi

if [ "${#TO_INSTALL[@]}" -gt 0 ]; then
	echo "TO_INSTALL ${TO_INSTALL[*]}"
	echo "#TO_INSTALL ${#TO_INSTALL[@]}"
	sudo "$PACKAGE_MANAGER" -S --noconfirm "${TO_INSTALL[@]}"
	echo "$ICON   [ Install packages ] - Installed missing packages: ${TO_INSTALL[*]}!"
else
	echo "$ICON   [ Install packages ] - No new packages to install."
fi
