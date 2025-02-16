# gcDEmv

Setup notes for getting an arch based system setup with my desktop environment.

## Very first things

- Install paru
  - _Do I need to do an indexing step?_
- Setup snapper: `paru -S snapper-support` (I originally installed btrfs-assistant as well, but don't think I want it in the future)
  - Create first snapshot
- Setup terminal
  - `fish` + configuration
    - `fisher` to install nvm.fish: `fisher install jorgebucaran/nvm.fish`
    - MAYBE look into `fnm` would make `npm` available for necessary applications (e.g. nvim plugins)
  - `alacritty`
  - `eza`
  - `bat`
- Setup "Desktop Environment" Hyprland:
  - `hyprland` + configuration
  - `hyprpaper` + configuration
  - `wofi` + configuration
  - `eww` + configuration
  - `brightnessctl`
  - `firefox-developer-edition` + betterfox
- Setup my IDE:
  - `nvim` + configuration
  - `ripgrep`
  - `fd`
  - `lazygit`
  - A nerd font e.g. `otf-geist-mono-nerd`

## Resources

<https://wearewaylandnow.com/>

## TODOs

- Configure clipboard + wofi (w/ dmenu stuff)
- Get bigger and better EWW
  - Or at least add WiFi to current
- Setup udisk
- Screenshot tool
- Bluetooth
- Audio control for video calls debug
- Disable middle mouse paste
- Setup `grim`/`hyprshot` screenshot util
- Setup fingerprint authentication
- Make `wofi` even prettier
- Emoji manager (e.g. `wofi-emoji`/`wofimoji`)
- Gamma & day/night adjustment (e.g. `hyprshade`/`hyprsunset`)
- Notification daemon: either `swaync` or `dunst`
  - w/ history, preferably on time in EWW bar
  - On Screen Display (e.g. [SwayOSD](https://github.com/ErikReider/SwayOSD)) for volume/brightness

## Legend

**Action**
 download/install
󰚰 update
󱩎 background services
󰒓 configuration/settings
󱍸 sync

**Progress**
󰔟 start/in progress
 new thing added (for idempotent actions where  means already exists)
 nothing to do
 done/finished
 error
 validation
󰍉 found
