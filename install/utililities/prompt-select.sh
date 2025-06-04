#!/bin/bash

set -e

# ###
# Script for prompting the user for a string and returning that string.
#
# If no default value is provided, requires user to input a value.
# ###

echo_usage_example() {
	echo -e "USAGE: $(basename "$0") <prompt message> <option 1> <option 2> ...\n" >&2
}

# Parse arguments
#
# - `PROMPT_MESSAGE` - what to ask the user
# - `SELECT_OPTIONS` - options to present to user
PROMPT_MESSAGE="$1"

if [[ ! $PROMPT_MESSAGE ]]; then
	echo -e "ERROR: Missing prompt message\n" >&2
	echo_usage_example
	exit 1
fi

shift 1
SELECT_OPTIONS=("$@")

if [[ ${#SELECT_OPTIONS[@]} -eq 0 ]]; then
	echo -e "ERROR: Missing options\n" >&2
	echo_usage_example
	exit 1
fi

prompt_select() {
	echo -e "$PROMPT_MESSAGE\n" >&2

	select choice in "${SELECT_OPTIONS[@]}"; do
		if [[ -n "$choice" ]]; then
			echo -e "\n\t You've chosen \e[1m$choice\e[0m\n" >&2

			echo "$choice"
			break
		else
			echo -e "Invalid selection. Please choose between 1-${#SELECT_OPTIONS[@]}.\n" >&2
		fi
	done
}

prompt_select
