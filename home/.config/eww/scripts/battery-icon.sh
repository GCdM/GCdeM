#!/usr/bin/bash
# Returns battery icon based on capacity and charging status

battery_path="/sys/class/power_supply/BAT1"
capacity=$(cat "$battery_path/capacity" 2>/dev/null || echo "0")
status=$(cat "$battery_path/status" 2>/dev/null || echo "Unknown")

# If charging, return charging icon
if [[ "$status" == "Charging" ]]; then
    echo "󰂄"
    exit 0
fi

# If full, return full icon
if [[ "$status" == "Full" ]] || [[ "$capacity" -eq 100 ]]; then
    echo "󰁹"
    exit 0
fi

# Return icon based on battery level
if [[ "$capacity" -ge 90 ]]; then
    echo "󰁹"
elif [[ "$capacity" -ge 70 ]]; then
    echo "󰂀"
elif [[ "$capacity" -ge 50 ]]; then
    echo "󰁾"
elif [[ "$capacity" -ge 30 ]]; then
    echo "󰁼"
elif [[ "$capacity" -ge 10 ]]; then
    echo "󰁻"
else
    echo "󰁺"
fi
