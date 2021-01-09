#! /bin/bash
mkdir ~/myvimrc
cd ~/myvimrc
echo "init git dir"
git init
echo "git config"
git config --global user.name zhk-0315
git config --global user.email zhk_0315@163.com
echo "git remote"
git remote add origin https://github.com/zhk-0315/myvimrc
echo "git pull"
git pull origin master