#! /bin/bash
lsblk
read -p "mount root diskpart": rootdisk
mount $rootdisk /mnt
mkdir /mnt/boot /mnt/home
mkdir /mnt/boot/efi
read -p "mount home disk": homedisk
read -p "mount boot disk": bootdisk
mount $homedisk /mnt/home
mount $bootdisk /mnt/boot/efi
pacstrap /mnt base linux-lts linux-firmware nano
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
