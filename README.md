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
| Shell         | Fish      |
| Terminal      | Alacritty |
| Bar & widgets | EWW       |

## Installation

This repo contains a bash installation script, `install.sh`. It can either be
run with a `curl` command, or by executing it locally after cloning the repo.

> [!warning]
>
> The instructions below don't yet work. This is a WIP

```bash
curl -L "https://raw.githubusercontent.com/GCdM/GCdeM/main/install.sh"\
  | bash
```

## File Structure

```text
|__ assets      --> wallpapers
|__ home        --> configuration files relative to $HOME (used for symlinking)
|__ install     --> installation subscripts (used by install.sh)
|__ utilities   --> simple bash scripts
```
