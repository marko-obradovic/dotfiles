# Arch Linux System Maintainance. 
System maintainance (and software maintainance in general) is an ongoing process that requires attention and responsibility.

This summarizes the key actions to take in order to keep arch linux healthy, optmized and fully working.

# System update/upgrade Permalink
Always have the latest version of the system up and running (including users apps and packages).

Sometimes things get broken due to the nature of the rolling release model, but since each installation is different, we are responsible for checking Arch Linux latest news in the Arch Linux website.

Once done, we can proceed to perform a system update/upgrade by running:
`sudo pacman -Syu` 

or if you are using any AUR helper (in my case yay):
`yay -Syu` 

## Troubleshooting
In case of package as marginal trust:

```
error: <package>: signature from "Someone <mail.of.someone>" is marginal trust
 ...
Do you want to delete it? [Y/n] 
```

Update the keyrings and run the full system upgrade command again:
`sudo pacman -Syu archlinux-keyring`

# Clean pacman cache
The package manager is our source of truth for what we use in our system, but its cache grows exponentially since it keeps ALL versions that we are installing/upgrading.

This is useful for system stability / rolling things back (by using `pacman -U /var/cache/pacman/pkg/name-version.pkg.tar.gz`) but it requires maintenance.

You can check which packages are cached and how much space they use like this:
```
sudo ls /var/cache/pacman/pkg/ | wc -l    <--- cached packages
du -sh /var/cache/pacman/pkg/             <--- space used
```

paccache can delete old, cached package versions, keeping only the 3 most recent ones by default - this needs to be installed:
`sudo pacman -Syu pacman-contrib`

Now we can easily clean everything up and keep the latest 3 versions (default behavior):
`sudo paccache -r`

# Remove orphan packages
Orphans are dependencies from uninstalled packages.

List all the orphans:
`sudo pacman -Qdtq`

Remove all orphans:
`sudo pacman -Qtdq | sudo pacman -Rns -`

## Troubleshooting

If you get `argument '-' specified with empty stdin`, there are no orphans found.

# Remove unwanted packages

List all installed packages to check what software we are no longer using:
`pacman -Qei | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h`

We can also list the ones installed from the AUR:
`pacman -Qim | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h`

To uninstall packages and their unused dependencies and configuration files:
`sudo pacman -Rns $(pacman -Qdtq)`

In case we want to individually uninstall packages, we use this command instead:
`sudo pacman -Rns <package-name>`

# Clean /home directory cache
Check cache size:
`sudo du -sh ~/.cache`

To clear it:
`rm -rf ~/.cache/*`

# System logs clean-up
System logs help fix issues and point you to what's going on in the distro, but they need a bit of maintenance.

To see how much space logs consume:
`journalctl --disk-usage`

You can remove logs after a certain amount of days:
`sudo journalctl --vacuum-time=7d`

You can set this up to be automatic by uncommenting `SystemMaxUse` in /etc/systemd/journald.conf.

For example:
`SystemMaxUse=500M`

This does the following:
- Limits total log size to 500 MB
- When logs exceed that:
    1. older logs are automatically deleted
    2. newer logs are kept

Reference - https://fernandocejas.com/blog/engineering/2022-03-30-arch-linux-system-maintance/
