#!/bin/bash
######################################################################
#7.1.PACMAN_INSTALL_COMMONLY_USED_SOFTWARES --- 

# Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
# Copyright © 2025, ZiLiang, all rights reserved.
# Created: 12 七月 2025
######################################################################

######################### Commentary ##################################
##  
######################################################################

echo "Install EMACS"
sudo pacman -S emacs

echo "Install LaTex"
sudo pacman -S texlive-latex texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-xetex texlive-bibtexextra  texlive-lang texlive-mathscience biber

echo "Install input methods"
sudo pacman -S fcitx5-im fcitx5-rime

echo "Install WPS"
sudo pacman -S libreoffice

yay -S wps-office-cn ttf-wps-fonts ttf-wps-win10 wps-office-fonts wps-office-365-edu-fonts

echo "Install Wechat & QQ"
yay -S wechat

# echo "Install youdao-dict"
# yay -S youdao-dict

echo "腾讯会议 zoom"
yay -S wemeet-bin
yay -S zoom

echo "Install tabby"
yay -S tabby


echo "RUNNING 7.1.pacman_install_commonly_used_softwares.sh DONE."
# 7.1.pacman_install_commonly_used_softwares.sh ends here
