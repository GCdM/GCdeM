#!/bin/bash

set -e

# ###
# Script for prompting the user for a string and returning that string.
#
# If no default value is provided, requires user to input a value.
# ###

echo_usage_example() {
	echo -e "USAGE: $(basename "$0") <prompt message> [--default <default value>]\n" >&2
}

# Parse arguments
#
# - `PROMPT_MESSAGE` - what to ask the user
# - `DEFAULT_VALUE` - _optional_
while [[ "$#" -gt 0 ]]; do
	case "$1" in
	--default)
		DEFAULT_VALUE="$2"
		shift 2
		;;
	*)
		if [[ ! $PROMPT_MESSAGE ]]; then
			PROMPT_MESSAGE="$1"
		else
			echo_usage_example
			exit 1
		fi

		shift 1
		;;
	esac
done

prompt_string() {
	local input

	if [[ -n "$DEFAULT_VALUE" ]]; then
		printf "%s \e[90m\e[3m[%s]\e[0m\n" "$PROMPT_MESSAGE" "$DEFAULT_VALUE" >&2
		read -r -p "> " input

		echo "${input:-$DEFAULT_VALUE}"
	else
		while [[ -z "${input:-}" ]]; do
			printf "%s\n" "$PROMPT_MESSAGE" >&2
			read -r -p "> " input

			[[ -z "$input" ]] && echo "Input cannot be empty. Please try again."
		done
		echo "$input"
	fi
}

prompt_string
