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
- neovim
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

Docker
*These are installed through pacman - it's an extra repository package so it's official.*
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
