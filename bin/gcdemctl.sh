#!/bin/bash

echo_usage() {
	echo -e "USAGE: $(basename "$0") <utility> <command>\n"
}

# ###
# A central control for personal command line utilities.
#
# This will be symlinked to `~/.local/bin/` to have as
# a CLI helper to be used by other functions.
# ###
# TODO: Might want to do with rust instead

GCDEMCTL_UTILITY="$1"

case $GCDEMCTL_UTILITY in
brightness)
	echo "<run brightness utility>"
	;;
*)
	echo "ERROR: Unknown command $GCDEMCTL_UTILITY"
	echo ""
	echo_usage
	exit
	;;
esac
