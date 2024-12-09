# GCdeM

My setup for an Arch-based distro w/ Wayland.

## Stack

| Function      | Software  |
| ------------- | --------- |
| Compositor    | Hyprland  |
| Terminal      | Alacritty |
| Bar & widgets | EWW       |

## Installation

This repo contains a bash installation script, `install.sh`. It is written such that it can either be run with a `curl` command, or by executing it locally after cloning the repo.

Either way, the host machine will need GitHub access to my private repo.

### Installing with `curl`

_TODO: Rewrite these instructions to not use `curl`, and just clone + execute_

1. Get a GitHub personal access token, with the `repo` scope.
2. Execute the script with the following command:

```bash
curl -H "Authorization: token <GITHUB ACCESS TOKEN>" \
     -L "https://raw.githubusercontent.com/GCdM/GCdeM/main/install.sh" | bash
```

## File Structure

```text
|__ assets      --> wallpapers
|__ home        --> configuration files relative to $HOME (used for symlinking)
|__ install     --> installation subscripts (used by install.sh)
|__ utilities   --> simple bash scripts
```
