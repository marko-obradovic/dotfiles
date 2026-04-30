# How to set up a usb in linux
```
`lsblk`
Unplugged:

:::  lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
nvme0n1     259:0    0 953.9G  0 disk
├─nvme0n1p1 259:1    0   260M  0 part /boot
├─nvme0n1p2 259:2    0     4G  0 part [SWAP]
└─nvme0n1p3 259:3    0 949.6G  0 part /

Plugged in:

:::  lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    1   1.4G  0 disk
└─sda1        8:1    1   1.4G  0 part
nvme0n1     259:0    0 953.9G  0 disk
├─nvme0n1p1 259:1    0   260M  0 part /boot
├─nvme0n1p2 259:2    0     4G  0 part [SWAP]
└─nvme0n1p3 259:3    0 949.6G  0 part /
```

Create your mount point:
```bash
sudo mkdir -p /mnt/usb
sudo mount /dev/sda1 /mnt/usb
```

UNMOUNT BEFORE YOU PLUG OUT

```bash
sudo umount /mnt/usb
```
