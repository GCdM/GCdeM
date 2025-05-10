# 🖥️ GCdeM

My "Desktop Environment" for an Arch-based system with Wayland.

> [!caution]
>
> This is by no means ready to use! It's being slowly cobbled together, in bits
> and pieces, but still needs to be fixed to work on a fresh headless Arch
> install. Currently, it serves as a note taking repository for critical DE
> applications.

This repo serves two purposes:

- dotfiles collection
- installation script to setup a fresh Linux install

The reason for this repo is that as I slowly build up my bespoke Desktop
Environment based on Hyprland, I would like to document what each component is
and be able to easily recreate my environment.

## Stack

| Function      | Software  |
| ------------- | --------- |
| Compositor    | Hyprland  |
| Terminal      | Alacritty |
| Shell         | Fish      |
| Bar & widgets | EWW       |

## Installation

This repo contains a bash installation script, `install.sh`. It can either be
run with a `curl` command, or by executing it locally after cloning the repo.

> [!warning]
>
> The instructions below are no longer true. The repo is now public, so the
> below needs updating.

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
