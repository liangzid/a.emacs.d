#!/bin/bash

echo "begin to download ncurses, which is the dependency of emacs..."

wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz

tar -xf ncurses-6.1

cd ncurses-6.1

./configure --prefix=/home/szhang/liangzi_need_smile/software/ncurses
make
make install

echo "config ncurses success. the path is: /home/szhang/liangzi_need_smile/software/ncurses"

echo"-------------------------------------------"

echo"now begin to install emacs."

wget https://ftp.wayne.edu/gnu/emacs/emacs-27.2.tar.gz

./configure --prefix=/home/szhang/liangzi_need_smile/software/emacs --with-x=no --with-gnutls=no LDFLAGS=-L/home/szhang/liangzi_need_smile/software/ncurses/lib CPPFLAGS=-I/home/szhang/liangzi_need_smile/software/ncurses/include

make

make install

echo "install emacs done."

echo"Now you should check your bash type, use `echo $SHELL` to find your shell type.\n If it is bash, you can edit your ~/.bashrc file with:\n `alias emacs=/home/szhang/liangzi_need_smile/software/emacs/bin/emacs`"


