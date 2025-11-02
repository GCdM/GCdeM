#!/bin/bash

# WiFi Status Script using iwd

WIFI_OFF_ICON="󰀝"          # Airplane mode / WiFi off
WIFI_DISCONNECTED_ICON="󰤯" # WiFi on but disconnected
WIFI_CONNECTING_ICON="󱛇"   # WiFi establishing connection
WIFI_NO_INTERNET_ICON="󰤭"  # WiFi connected but no internet
WIFI_CONNECTED_ICON="󰤨"    # WiFi connected with internet

is_wifi_adapter_off() {
  iwctl adapter list 2>/dev/null | grep -q "off"
}

# Returns the station status (connected, disconnected, etc.)
get_station_status() {
  local station
  station=$(iwctl station list 2>/dev/null | grep 'wlan' | awk '{print $2}' | head -n1)
  if [ -n "$station" ]; then
    iwctl station "$station" show 2>/dev/null | grep "State" | awk '{print $2}'
  fi
}

# Function to get connected network name
get_connected_network() {
  local station
  station=$(iwctl station list 2>/dev/null | grep 'wlan' | awk '{print $2}' | head -n1)
  if [ -n "$station" ]; then
    iwctl station "$station" show 2>/dev/null | grep "Connected network" | awk '{for(i=3;i<=NF;i++) printf "%s ", $i; print ""}'
  fi
}

check_internet_connection() {
  ping -c 1 -W 3 1.1.1.1 >/dev/null 2>&1
  return $?
}

# Main function to determine WiFi status
# Outputs in format: ICON|STATUS_TEXT
get_wifi_status() {
  # Check if WiFi adapter is powered on
  if is_wifi_adapter_off; then
    echo "$WIFI_OFF_ICON|WiFi Off"
    return
  fi

  # Get station status
  local status
  status=$(get_station_status)

  case "$status" in
  "connected")
    local network
    network=$(get_connected_network | xargs) # Remove leading/trailing whitespace

    # Check internet connectivity
    if check_internet_connection; then
      echo "$WIFI_CONNECTED_ICON|$network"
    else
      echo "$WIFI_NO_INTERNET_ICON|$network (No Internet)"
    fi
    ;;
  "connecting")
    echo "$WIFI_CONNECTING_ICON|Connecting..."
    ;;
  "disconnected" | "")
    echo "$WIFI_DISCONNECTED_ICON|Disconnected"
    ;;
  *)
    # Fallback for unknown states
    echo "$WIFI_DISCONNECTED_ICON|Unknown"
    ;;
  esac
}

# Execute main function
get_wifi_status
