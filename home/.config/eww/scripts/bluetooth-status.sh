#!/bin/bash

# Script for returning the icon to display based on the bluetooth status.
#
# States are:
# - Powered off - <no display>
# - Powered on but disconnected - 󰂯
# - Powered on and connected - 

# Check if Bluetooth is powered on
if bluetoothctl show | grep -q "Powered: yes"; then
  # Bluetooth is powered on, check if any device is connected
  if bluetoothctl devices Connected | grep -q "Device"; then
    # Connected to at least one device
    echo ""
  else
    # Powered on but not connected
    echo "󰂯"
  fi
else
  # Bluetooth is powered off, display nothing
  echo ""
fi
