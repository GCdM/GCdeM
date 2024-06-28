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
