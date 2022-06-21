#!/bin/bash

sudo apt-get update
sudo apt-get install build-essential
sudo apt build-dep emacs

cd ~/emacs-28.1
sudo apt-get install autoconf
sudo apt install gnutls
sudo apt install pkg-config
sudo apt install libgnutls
sudo apt install libgnutls-dev
sudo apt install libncurses-dev
sudo apt install texinfo
sudo apt autoremove emacs

./autogen.sh --with-x-toolkit=no
./configue --with-x=no

make bootstrap
sudo make install
