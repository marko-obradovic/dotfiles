Make sure you have a different branch for this setup.

1. Install sway
2. Install xwayland
3. Run `sway` - if it doesn't work, run `sway --unsupported-gpu`
4. Make sure `systemctl is-system-running` returns `running`
    - If not, go into `/etc/wsl.conf`, and include the following:
    ```conf
    [boot]
    systemd=true
    ```
5. Make sure your $mod key is mod1 (alt) - win key doesn't work.
6. Sway will be a floating window by default, with no way to click to maximise, minimise, or move it around - press win key + up to fullscreen it - then win key + down to reduce it.
7. Remove `.git/` in dotfiles when you clone them over - don't version this because it'll most likely need a lot of tweaking down the line.
