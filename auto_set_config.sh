#! /bin/bash
touch ~/.xprofile
echo -e "tint2 &\nnm-applet &\n\nexport LANG=zh_CN.UTF-8\nexport LANGUAGE=zh_CN:en_US" >> ~/.xprofile
cp /etc/bash.bashrc ~/.bashrc
sudo pacman -S bash-completion neofetch lolcat
echo -e "export PATH=$PATH:/usr/share\nexport LANG=zh_CN.UTF-8\nexport LANGUAGE=zh_CN:en_US\nneofetch | lolcat\nlspci | grep -i vga" >> ~/.bashrc
