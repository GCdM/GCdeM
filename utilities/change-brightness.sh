#!/bin/bash

echo_usage() {
	echo -e "USAGE: $(basename "$0") up|down\n"
}

DIRECTION="$1"

if [[ "$DIRECTION" == "up" ]]; then
	brightnessctl -q set +5%
elif [[ "$DIRECTION" == "down" ]]; then
	current_brightness=$(brightnessctl get)
	max_brightness=$(brightnessctl max)

	percentage=$(awk "BEGIN {print int(($current_brightness / $max_brightness) * 100)}")

	if [[ "$percentage" -le 5 ]]; then
		brightnessctl -q set 1
	else
		brightnessctl -q set 5%-
	fi
else
	echo -e "ERROR: Invalid command $DIRECTION\n"
	echo_usage
	exit 1
fi
