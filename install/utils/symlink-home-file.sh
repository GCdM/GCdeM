#!/bin/bash

set -e

# ###
# Script for symlinking files from $GCDEM_PATH/home to $HOME.
#
# Used to store common configuration files (.config/*, dotfiles,
# etc...) in this repo, and easily sync them with the current
# machine by symlinking them.
#
# Also creates backups in $HOME/.backup/home/ in case existing
# configurations already exist.
# ###

ICON="󰈮"

function echo_usage_example() {
	echo "$ICON 󱍸  [ Symlink $RELATIVE_PATH_FROM_HOME ] - USAGE: $0 <relative path (from \$HOME)> [--icon <nerd font icon>]"
}

function does_path_exist() {
	if [[ -d "$1" || -f "$1" || -L "$1" ]]; then
		return 0
	else
		return 1
	fi
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
	case "$1" in
	--icon)
		ICON="$2"
		shift 2
		;;
	*)
		if [[ ! $RELATIVE_PATH_FROM_HOME ]]; then
			RELATIVE_PATH_FROM_HOME="$1"
		else
			echo_usage_example
			exit 1
		fi

		shift 1
		;;
	esac
done

if [[ ! $RELATIVE_PATH_FROM_HOME ]]; then
	echo_usage_example
	exit 1
fi

SOURCE_PATH="$GCDEM_PATH/home/$RELATIVE_PATH_FROM_HOME"

if ! does_path_exist "$SOURCE_PATH"; then
	echo "$ICON 󱍸  [ Symlink $RELATIVE_PATH_FROM_HOME ] - GCdeM does not have target files $SOURCE_PATH"
	exit 1
fi

DESTINATION_PATH="$HOME/$RELATIVE_PATH_FROM_HOME"

if does_path_exist "$DESTINATION_PATH"; then
	echo "$ICON 󱍸 󰍉 [ Symlink $RELATIVE_PATH_FROM_HOME ] - Found existing files in $DESTINATION_PATH"

	if [ "$(readlink -- "$DESTINATION_PATH")" = "$SOURCE_PATH" ]; then
		echo "$ICON 󱍸  [ Symlink $RELATIVE_PATH_FROM_HOME ] - Looks like $RELATIVE_PATH_FROM_HOME is already synced!"
		exit 0
	fi

	BACKUP_DIRECTORY="$HOME/.backup/home"
	mkdir -p "$BACKUP_DIRECTORY"

	BACKUP_TIMESTAMP=$(date +"%y-%m-%d.%H_%M_%S")
	BACKUP_FILENAME="$RELATIVE_PATH_FROM_HOME@$BACKUP_TIMESTAMP" # e.g. ".bashrc@24-12-10.15_37_02"
	BACKUP_PATH="$BACKUP_DIRECTORY/$BACKUP_FILENAME"
	mv "$DESTINATION_PATH" "$BACKUP_PATH" 2>/dev/null
	# rmdir "$DESTINATION_PATH" 2>/dev/null || echo "Couldn't remove non-empty directory (likely symlink)."
	echo "$ICON 󱍸 󱍼 [ Symlink $RELATIVE_PATH_FROM_HOME ] - Created backup at $BACKUP_PATH"
fi

echo "$ICON 󱍸 󰔟 [ Symlink $RELATIVE_PATH_FROM_HOME ] - Symlinking $SOURCE_PATH..."

# TODO make this less hacky maybe
mkdir -p "$DESTINATION_PATH"
rmdir "$DESTINATION_PATH"

ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "$ICON 󱍸  [ Symlink $RELATIVE_PATH_FROM_HOME ] - Symlinked $DESTINATION_PATH!"
