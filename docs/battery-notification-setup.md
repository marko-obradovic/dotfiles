`../scripts/battery-alert.sh` is a script that will notify you when your battery is low.

`../systemd/user/battery-alert.service` creates a service that calls this script

`../systemd/user/battery-alert.timer` creates a timer that will run the service every few minutes.

# First time setup:
```
systemctl --user daemon-reload
systemctl --user enable --now battery-alert.timer
systemctl --user list-timers
```

To see what's happening in the background: `journalctl --user -u battery-alert.service -f`

Reference: https://ejmastnak.com/tutorials/arch/battery-alert/
