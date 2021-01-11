#! /bin/bash
ctags -I __THROW --extras=+F --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p \
    --fields=+S  -R -f $HOME/.cache/systags /usr/include /usr/local/include
