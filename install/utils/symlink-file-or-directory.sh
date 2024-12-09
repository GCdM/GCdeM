#!/bin/bash

SOURCE_PATH=false
DESTINATION_PATH=false
BACKUP_TIMESTAMP=$(date +"%y-%m-%d.%H_%M_%S")
DESCRIPTION="given application"
ICON="󰈮"

function echo_usage_example() {
	echo "$ICON 󱍸  Symlink $DESCRIPTION - USAGE: $0 <source path> <destination path> [--description <application name>] [--icon <nerd font icon>]"
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
	case "$1" in
	--description)
		DESCRIPTION="$2"
		shift 2
		;;
	--icon)
		ICON="$2"
		shift 2
		;;
	*)
		if [[ ! $SOURCE_PATH ]]; then
			SOURCE_PATH="$1"
		elif [[ ! $DESTINATION_PATH ]]; then
			DESTINATION_PATH="$1"
		else
			echo_usage_example
			exit 1
		fi

		shift 1
		;;
	esac
done

if [[ ! -d "$SOURCE_PATH" ]]; then
	echo "$ICON 󱍸  Symlink $DESCRIPTION - Source path does not exist: $SOURCE_PATH"
	exit 1
fi

RELATIVE_PATH="${SOURCE_PATH/#$HOME\//}"
BACKUP_DIRECTORY="$HOME/.backup/$RELATIVE_PATH@$BACKUP_TIMESTAMP"

if [[ -d "$DESTINATION_PATH" ]]; then
	echo "$ICON 󱍸 󰍉 Symlink $DESCRIPTION - Found existing files for $DESCRIPTION."
	# TODO Check whether files are already symlinked as expected. If so exit with a success message.

	mkdir -p "$BACKUP_DIRECTORY"
	mv "$DESTINATION_PATH" "$BACKUP_DIRECTORY" 2>/dev/null
	rmdir "$DESTINATION_PATH" 2>/dev/null || echo "Couldn't remove non-empty directory (likely symlink)."
	echo "$ICON 󱍸 󱍼 Symlink $DESCRIPTION - Created backup at $BACKUP_DIRECTORY"
fi

echo "$ICON 󱍸 󰔟 Symlink $DESCRIPTION - Symlinking $DESCRIPTION..."
mkdir -p "$CONFIG_DIR"
ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "$ICON 󱍸  Symlink $DESCRIPTION - Symlinked $DESCRIPTION!"
