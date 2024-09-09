#!/bin/bash
######################################################################
#0.MAKE_INSTALL_EMACS29 ---

# Make Install Emacs 29 on Linux systems.

# Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
# Copyright © 2024, ZiLiang, all rights reserved.
# Created:  9 September 2024
######################################################################

######################### Commentary ##################################
##  
######################################################################

echo "installing compile packages"
sudo apt install -y build-essential automake autoconf libncurses-dev libxpm-dev libgif-dev gnutls-dev

echo "Download the emacs"

cd ~/

wget http://mirror.team-cymru.com/gnu/emacs/emacs-29.2.tar.gz

tar -xf emacs-29.2.tar.gz

./autogen.sh

echo "sleep 20 seconds..."
sleep 20

./configure --without-dbus --without-gconf

echo "sleep 20 seconds..."
sleep 20

make

sudo make install

emacs --version

echo "RUNNING 0.make_install_emacs29.sh DONE."
# 0.make_install_emacs29.sh ends here
