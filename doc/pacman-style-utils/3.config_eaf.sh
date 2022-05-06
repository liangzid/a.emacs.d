#!/bin/bash

echo "install some important softwares."
sudo pacman -S nodejs

echo "first copy the file of eaf to target places."
git clone --depth 1 -b master https://gitee.com/emacs-eaf/emacs-application-framework.git ~/.emacs.d/other-files/emacs-application-framework

cd ~/.emacs.d/other-files/emacs-application-framework
python3 install-eaf.py --use-gitee

# #sudo pacman -S python-epc
# #sudo pacman -S python-pyqt5
# #sudo pacman -S python-pyqt5-sip
# #sudo pacman -S python-pyqtwebengine
# sudo pacman -S wmctrl
# sudo pacman -S xdotool
# sudo pacman -S pygetwindow
# #sudo pacman -S python-pymupdf
# #sudo pacman -S python-qrcode
# sudo pacman -S aria2
# sudo pacman -S libreoffice
# sudo pacman -S filebrowser-bin
# #sudo pacman -S python-qtconsole
# #sudo pacman -S python-retrying
