#! bin/bash
dd if=/dev/zero of=/swapfile bs=2M count=8192 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapoff /swapfile
echo "/swapfile none    swap    defaults    0 0" >> /etc/fstab
timedatectl set-timezone Asia/Shanghai
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
hostnamectl set-hostname arch
echo -e "127.0.0.1  localhost\n::1      localhost\n127.0.1.1    arch.localdomain    arch" >> /etc/hosts
echo '\n\n\n\n\n\n' | pacman -S grub efibootmgr networkmanager network-manager-applet dialog wireless_tools wpa_supplicant os-prober mtools dosfstools ntfs-3g base-devel linux-lts-headers reflector sudo
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Archlinux
mkdir /mnt/win
read -p "mount win sysdisk": windisk
if [ $windisk == /nothing ];then
else	
    mount $windisk /mnt/win
fi
grub-mkconfig -o /boot/grub/grub.cfg
echo '\n\n\n\n\n' | pacman -S xorg-server xorg-xinit xorg-apps ttf-sarasa-gothic nvidia nvidia-utils
systemctl enable NetworkManager 
read "your wants desktops only support: \n1xfce\n2kde\n3gnome\n": desktop
if [ desktop == 1 ];then
    pacman -S lightdm lightdm-gtk-greeter xfce4 xfce4-goodies 
    systemctl enable lightdm
elif [desktop == 2];then
    pacman -S sddm plasma kde-applications packagekit-qt5
    systemctl enable sddm
elif [ desktop == 3 ];then
    pacman -S gdm gnome
    systemctl enable gdm
else 
    echo "no desktop"
fi
passwd
useradd -mG wheel zhang
passwd zhang
EDITOR=nano visudo
