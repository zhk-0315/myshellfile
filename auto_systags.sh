#! /bin/bash
if [ ! -f $HOME/.cache/systags ];then
    ctags -I __THROW --extras=+F --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p \
        --fields=+S  -R -f $HOME/.cache/systags /usr/include /usr/local/include
fi
