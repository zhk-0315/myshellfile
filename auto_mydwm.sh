#! /bin/bash
rm -r ~/.mydwm
mkdir ~/.mydwm
cd ~/.mydwm
echo "init git dir"
git init
echo "git config"
git config --global user.name zhk-0315
git config --global user.email zhk_0315@163.com
echo "git remote"
git remote add origin https://github.com/zhk-0315/mydwm
echo "git pull"
git pull origin master
cd ~/.mydwm/dwm-6.2
sudo make clean install
cd ~/.mydwm/st-0.8.4
sudo make clean install
