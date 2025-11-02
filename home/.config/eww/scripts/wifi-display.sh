#!/bin/bash

# Script to extract icon or text from wifi-status.sh output
# Usage: wifi-display.sh [icon|text]

MODE="${1:-icon}"

# Get the full status from wifi-status.sh
STATUS=$(~/.config/eww/scripts/wifi-status.sh)

# Split the output using bash parameter expansion
IFS='|' read -r ICON TEXT <<< "$STATUS"

# Declare associative array (map) for output
declare -A OUTPUT_MAP
OUTPUT_MAP[icon]="$ICON"
OUTPUT_MAP[text]="$TEXT"

# Output based on the requested mode
echo "${OUTPUT_MAP[$MODE]}"
