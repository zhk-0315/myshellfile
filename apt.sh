#! /bin/bash

sed -e 4a\ /etc/pacman.d/mirrorlist
echo 'y\ny\ny\n' | pacman -Syyy

