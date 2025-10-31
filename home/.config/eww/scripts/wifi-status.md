# WiFi Status Script

This script displays WiFi connection status using `iwd` (Intel WiFi Daemon) and nerd font icons.

## Features

The script distinguishes between the following WiFi states:

1. **Airplane Mode** (󰖪) - WiFi adapter is powered off
2. **Disconnected** (󰤭) - WiFi is on but not connected to any network
3. **Connecting** (󰤩) - WiFi is in the process of establishing a connection
4. **Connected (No Internet)** (󰤨) - WiFi is connected but no internet access
5. **Connected** (󰤨) - WiFi is connected with internet access

## Usage

Make the script executable and run it:

```bash
chmod +x wifi-status.sh
./wifi-status.sh
```

## Integration with EWW

You can use this script in your EWW configuration to display WiFi status:

```lisp
(defwidget wifi-status []
  (box :class "wifi-status"
    (label :text {exec("~/.config/eww/scripts/wifi-status.sh")})))
```

## Requirements

- `iwd` (Intel WiFi Daemon) must be installed and running
- A nerd font must be installed for proper icon display
- `ping` command for internet connectivity testing

## Notes

- The script uses Google DNS (8.8.8.8) to test internet connectivity
- Error output is suppressed to avoid cluttering the display
- The script automatically detects the first available WiFi station

