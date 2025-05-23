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
#sudo apt install -y build-essential automake autoconf libncurses-dev libxpm-dev libgif-dev gnutls-dev libjpeg-dev libtiff-dev libx11-dev
sudo apt install build-essential libgtk-3-dev libgnutls28-dev libtiff5-dev libgif-dev libjpeg-dev libpng-dev libxpm-dev libncurses-dev texinfo

echo "Download the emacs"

cd ~/

wget http://mirror.team-cymru.com/gnu/emacs/emacs-30.1.tar.gz

tar -xf emacs-30.1.tar.gz

cd emacs-30.1
./autogen.sh

echo "sleep 20 seconds..."
sleep 10

./configure --without-dbus --without-gconf --with-rsvg

echo "sleep 20 seconds..."
sleep 10

make

sudo make install

emacs --version

echo "RUNNING 0.make_install_emacs29.sh DONE."
# 0.make_install_emacs29.sh ends here
