# Dotfiles symlinked on my machine

## Install with stow:
```bash
stow --target ~/.config .
```

# Connecting to internet
use `nmcli` commands (comes with NetworkManager)

Typical workflow:
`nmcli device wifi list`
`nmcli device wifi connect BSSID` (if no password)
`nmcli device wifi connect BSSID --ask` (if password)

# My Packages
General
- Any nerd font
- tmux
- stow
- flameshot
- grim (for flameshot)
- noto-fonts-emoji
- nix-prompt: https://github.com/nix-tricks/nix-prompt
- npm (FIXES MASON NOT BEING ABLE TO INSTALL PRETTIER / BASH LANGUAGE SERVER)
- man-db
- ripgrep
- pacman-contrib (for paccache)
- brightnessctl
- swaybg
- unzip
- less
- gammastep
- waybar
- openssh
- sway
- alacritty
- yay
- NetworkManager
- obsidian
- git
- github-cli
- brave-bin
- tree
- fuzzel
- swaylock

Bluetooth:
https://wiki.archlinux.org/title/Bluetooth
- bluez
- bluez-utils
bluetoothctl comes with this - that's what you use to connect to devices
Make sure to enable and start bluetooth.service:
`sudo systemctl enable bluetooth`
`systemctl enable --now bluetooth.service`
You can also use bluetui (need to install it via pacman)


Neovim
*Note: If something doesn't install properly through Mason, just do `:Mason` in Nvim and try to install it yourself by pressing `i` on it.*
- neovim
- luarocks (luacheck dependency)
- argparse (luacheck dependency)
    - INSTALL THIS VIA `sudo luarocks install argparse` - https://luarocks.org/modules/argparse/argparse
    - If argparse can't be installed because the current lua version doesn't work:
        - To check what versions work with it, run `sudo luarocks -- install argparse --check-lua-versions`
        - Install the version of lua you need - e.g. `sudo pacman -S lua54` - https://wiki.archlinux.org/title/Lua
        - Install argparse for that version- e.g. `sudo luarocks --lua-version=5.4 install argparse`
    - To set that version as default:
        - `ls /usr/bin/lua*` (check versions you have)
        - `luarocks config --local lua_version 5.4`
        OR
        - `export LUA_VERSION=5.4` in your .bashrc

Docker
*Note: These are installed through pacman - it's an extra repository package so it's official.*
- docker 
- docker-compose
- docker-buildx

Notifications
- mako (notifs - to reset the config, `killall mako` first)
- libnotify (contains notify-send which you can use to test mako notifs)

Audio
- pipewire
- pipewire-pulse
- pipewire-alsa
- wireplumber

FOR LAPTOP (Intel Drivers)
- intel-gpu-tools
- intel-media-driver
- libva-intel-driver
- intel-ucode
- vulkan-intel

FOR PC (NVIDIA Drivers)
- [TBC]
