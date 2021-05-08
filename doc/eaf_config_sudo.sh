#!/bin/bash

# download eaf from github.
echo "begin to clone eaf..."
git clone --depth=1 -b master https://github.com/manateelazycat/emacs-application-framework.git ~/.emacs.d/site-lisp/emacs-application-framework/

# install some dependency
echo "begin to install some dependency."

sudo pacman -S python-epc
sudo pacman -S python-pyqt5
sudo pacman -S python-pyqt5-sip
sudo pacman -S python-pyqtwebengine
sudo pacman -S wmctrl
sudo pacman -S xdotool
sudo pacman -S pygetwindow
sudo pacman -S nodejs
sudo pacman -S python-pymupdf
sudo pacman -S python-qrcode
sudo pacman -S aria2
sudo pacman -S libreoffice
sudo pacman -S filebrowser-bin
sudo pacman -S python-qtconsole
sudo pacman -S python-retrying


