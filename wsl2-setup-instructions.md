Make sure you have a different branch for this setup.

1. Install sway
2. Install xwayland
3. Install https://github.com/jordankoehn/sway-wsl2 (follow the instructions on the page) - OR I think you can run sway without this by running `sway --unsupported-gpu`
4. Make sure `systemctl is-system-running` returns `running`
    - If not, go into `/etc/wsl.conf`, and include the following:
    ```conf
    [boot]
    systemd=true
    ```
5. Make sure your $mod key is mod1 (alt) - win key doesn't work.
