# gcDEmv

Setup notes for getting an arch based system setup with my desktop environment.

## Very first things

- Install paru
  - _Do I need to do an indexing step?_
- Setup snapper: `paru -S snapper-support` (I originally installed
  btrfs-assistant as well, but don't think I want it in the future)
  - Create first snapshot
- Setup terminal
  - `fish` + configuration
    - `fisher` to install nvm.fish: `fisher install jorgebucaran/nvm.fish`
    - MAYBE look into `fnm` would make `npm` available for necessary
      applications (e.g. nvim plugins)
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
  - On Screen Display (e.g. [SwayOSD](https://github.com/ErikReider/SwayOSD))
    for volume/brightness
- Understand nuances of `networkmanager` vs alternatives (e.g. VPN control)
- Use `make` for install command

## Legend

**Action**  download/install 󰚰 update 󱩎 background services 󰒓
configuration/settings 󱍸 sync

**Progress** 󰔟 start/in progress  new thing added (for idempotent actions where
 means already exists)  nothing to do  done/finished  error  validation 󰍉
found

## Claude analysis of project

### Prompt

_Included `README.md`, `install.sh`, and `install/**`_

> You are an experienced system administrator and power Linux user, and I would
> like your help to create a project for setting up a bespoke Desktop
> Environment in a fresh headless Arch Linux installation. Below is the
> <purpose> and <design> of the project called GCdeM.
>
> <purpose>
> GCdeM is a personal desktop environment setup project for Arch Linux with Wayland. It serves dual purposes: (1) a dotfiles collection for maintaining configuration files, and (2) an automated installation script to recreate a complete desktop environment from scratch on a fresh Arch install. The project aims to document and automate the setup of a bespoke desktop environment based on Hyprland compositor.
> </purpose>
> <design>

> The project is organized into a modular structure:
>
> **File Structure:**
>
> - `home/` - Contains configuration files relative to $HOME for symlinking
>   dotfiles
> - `install/` - Modular installation subscripts organized by functionality
> - `utilities/` - Helper bash scripts for common operations
> - `assets/` - Resources like wallpapers
>
> **Installation Architecture:**
>
> - Main `install.sh` orchestrates the setup process by calling numbered
>   subscripts
> - Each install script handles a specific component (00_package-manager.sh,
>   01_git.sh, 02_hyprland.sh, etc.)
> - Utility scripts provide reusable functions like package installation,
>   symlink creation, and environment variable validation
>
> **Key Design Patterns:**
>
> - Modular approach with numbered scripts for ordered execution
> - Environment variables (GCDEM_PATH, PACKAGE_MANAGER, TERMINAL) shared across
>   scripts
> - Symlink-based configuration management to maintain dotfiles in the repo
> - Backup system for existing configurations before replacement
> - Error handling with `set -e` for script safety
>
> **Technology Stack:**
>
> - Hyprland (compositor), Fish (shell), Alacritty (terminal), EWW (bar/widgets)
> - Uses `paru` as the AUR helper for package management
> - Includes developer tools, security configurations, and laptop-specific
>   optimizations
>
> The project is currently work-in-progress, with some scripts containing only
> TODO comments for future implementation. </design>
>
> Please critique the project's design, highlighting <pros> and <cons>,
> explaining why for each. Also add <suggestions> for improvements in the
> approach to achieve the original <purpose>

### Claude

Based on my analysis of the GCdeM project design as an experienced system
administrator, here's my critique:

<pros>

- **Modular Architecture**: The numbered script approach (00*, 01*, 02\_)
  provides clear execution order and makes it easy to isolate failures or skip
  specific components during debugging. This is excellent for maintainability.

- **Dotfiles Integration**: Combining installation automation with dotfiles
  management in a single repository is practical - users get both the setup
  process and ongoing configuration management in one place.

- **Environment Variable Strategy**: Using shared variables like GCDEM_PATH,
  PACKAGE_MANAGER, and TERMINAL across scripts creates consistency and makes the
  system adaptable to different environments.

- **Backup System**: Including configuration backups before replacement shows
  good operational awareness - this prevents data loss and allows rollbacks.

- **Error Handling**: Using `set -e` for script safety demonstrates proper bash
  scripting practices and helps catch issues early.

- **Technology Choices**: Hyprland + Fish + Alacritty + EWW represents a modern,
  lightweight Wayland-native stack that's well-suited for a custom desktop
  environment.

</pros>

<cons>

- **Limited Error Recovery**: While `set -e` catches errors, there's no apparent
  mechanism for partial recovery or continuing after non-critical failures. A
  failed package installation could halt the entire process.

- **No Dependency Management**: The numbered script approach assumes linear
  dependencies, but real-world package dependencies are often more complex. Some
  components might need to be installed in parallel or have conditional
  dependencies.

- **Hardcoded Assumptions**: The design appears to assume specific tools (paru,
  specific package names) without runtime detection or fallback options for
  different Arch configurations.

- **No State Tracking**: There's no apparent mechanism to track what's already
  installed or configured, making it difficult to resume interrupted
  installations or perform incremental updates.

- **Limited User Interaction**: The automated approach may not account for user
  preferences or system-specific requirements that need runtime decisions.

- **Testing Challenges**: The monolithic installation approach makes it
  difficult to test individual components or validate configurations without
  running the full installation.

</cons>

<suggestions>

- **Add Idempotency**: Implement checks to detect existing installations and
  skip or update appropriately. This allows safe re-running and incremental
  updates.

- **Implement Logging and State**: Add comprehensive logging and state tracking
  (perhaps a simple JSON file) to record what's been installed, when, and with
  what configuration.

- **Add Configuration Profiles**: Create multiple configuration profiles
  (minimal, full, developer, gaming) to accommodate different use cases and
  system resources.

- **Improve Error Handling**: Implement graceful degradation - allow
  non-critical components to fail without stopping the entire process. Add retry
  mechanisms for network-dependent operations.

- **Add Validation Layer**: Include pre-flight checks for system requirements,
  network connectivity, and disk space before beginning installation.

- **Create Rollback Mechanism**: Beyond backups, implement a proper rollback
  system that can undo changes if the installation fails partway through.

- **Add Interactive Mode**: Provide both automated and interactive modes,
  allowing users to customize the installation process for their specific needs.

- **Implement Parallel Processing**: Where possible, allow independent
  components to install in parallel to reduce total installation time.

- **Add System Detection**: Implement runtime detection of existing tools,
  package managers, and system configurations to make the scripts more portable
  across different Arch setups.

- **Create Testing Framework**: Develop a way to test individual components in
  isolation, possibly using containers or virtual machines for validation.

</suggestions>
