#! /bin/bash

VIMDIR=$HOME/.vim;
if [ ! -d $VIMDIR ];then
    mkdir $VIMDIR 
fi
if [ ! -d $HOME/.vim_plug ];then
    mkdir $HOME/.vim_plug $HOME/.vim_plug/plugged
fi

if [ ! -e $VIMDIR/vimrc ];then
    cd $VIMDIR
    echo "init git dir"
    git init
    echo "git config"
    git config --global user.name zhk-0315
    git config --global user.email zhk_0315@163.com
    echo "git remote"
    git remote add origin https://github.com/zhk-0315/myvimrc
    echo "git pull"
    git pull origin master
fi

if [ ! -f /usr/bin/nvim ];then
    sudo pacman -S neovim python-pynvim
fi

NVIMDIR=$HOME/.config/nvim;
if [ ! -d $NVIMDIR/autoload/plug.vim ];then
    mkdir -p $NVIMDIR/autoload
    cp $VIMDIR/autoload/plug.vim $NVIMDIR/autoload/
fi
if [ ! -f $NVIMDIR/init.vim ];then
    touch $NVIMDIR/init.vim
    echo -e 'set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after\nlet &packpath=&runtimepath\nsource $HOME/.vim/vimrc' >> $NVIMDIR/init.vim
fi
if [ ! -f $NVIMDIR/coc-settings.json ];then
    cp $VIMDIR/coc-settings.json $NVIMDIR/coc-settings.json
fi
