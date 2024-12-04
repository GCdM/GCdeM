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
  - `alacritty`
  - `eza`
  - `bat`
- Setup "Desktop Environment" Hyprland:
  - `hyprland` + configuration
  - `hyprpaper` + configuration
  - `wofi` + configuration
  - `waybar` + configuration
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

- Set tab defaults to 4 spaces (add .vimrc to GCdeM)
- Configure clipboard + wofi (w/ dmenu stuff)
- Get bigger and better EWW
  - Or at least add WiFi to current
- Setup udisk
- Screenshot tool
- Bluetooth
- Audio control for video calls debug
- Disable middle mouse paste
- Add a screenshot util

 square check
 download
󰒓 settings cog
󰔟 sand timer
󱍸 sync
 error
 validation
