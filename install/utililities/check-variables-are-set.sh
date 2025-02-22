#!/bin/bash

# === ================================================ ===
# Takes a list of environment variable names, and checks
# all are set. If any are missing, errors w/ exit code 1.
# === ================================================ ===

# Check for least one argument
if [ "$#" -eq 0 ]; then
	echo "    Usage: $0 VAR1 VAR2 VAR3 ..."
	exit 1
fi

unset_vars=()

for var in "$@"; do
	if [ -z "${!var}" ]; then
		unset_vars+=("$var")
	fi
done

if [ "${#unset_vars[@]}" -ne 0 ]; then
	echo "    ERROR: These required environment variables are empty:"
	for missing in "${unset_vars[@]}"; do
		echo " - $missing"
	done

	exit 1
fi

exit 0
