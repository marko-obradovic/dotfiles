To check what's in a PKGBUILD of a package you're getting from the AUR, use:
```bash
yay -G <package-name>
cd <package-name>
nvim PKGBUILD
```

# In case of failed package install
If a package doesn't install properly because you had to stop the install or whatever reason, try `sudo pacman -Syu` and try again
