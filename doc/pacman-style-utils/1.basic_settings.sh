#!/bin/bash
########################################################
#1.BASIC_SETTINGS --- this is the basic settings for pacman style installation.

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2022, ZiLiang, all rights reserved.
# Created:  6 五月 2022
########################################################

########### Commentary ##################################
##  nothing.
########################################################

export inKDE=1

echo "first setting to the same time for two operation systems."
timedatectl set-local-rtc 1

echo "1. begin to update the source of pacman."
echo "switch to china"
sudo pacman -Syy
sudo pacman-mirrors -i -c China -m rank
echo "now sleep 30 second."
sleep 30
sudo pacman -Syyu

echo "now appending the `archlinuxcn` into `/etc/pacman.conf`"
sudo echo "[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux-cn/$arch" >>/etc/pacman.conf 

echo "now update keyrings..."
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
echo "and update OS"
sudo pacman -Su

echo "Finally, we should install YAY..."
sudo pacman -S yay

echo "----------------------------------------------------------------"
echo "NOW EVERYTHING DONE FOR BASIC SETTINGS!"
echo "----------------------------------------------------------------"

clear
echo "2. Fixing Chinese Input Methods."
echo "2.1 instal packages..."
yay -S fcitx-im #输入法框架
yay -S fcitx5-pinyin-sougou #搜狗输入法（推荐）
sudo pacman -S fcitx-googlepinyin #google拼音
yay -S fcitx-rime #小狼毫输入法
yay -S fcitx-configtool #配置fcitx5的环境变量
yay -S rime-cloverpinyin #安装rime-cloverpinyin（输入方案）

if $inKDE==1
then
   yay -S kcm-fcitx
   sudo echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx" >> ~/.xprofile
fi
yay -S fcitx-skin-material
yay -S base-devel
yay -S fcitx5-pinyin-zhwiki-rime
yay -S fcitx5-material-color
# yaourt -S sublime-text-3-imfix

echo "install chinese fonts..."
sudo pacman -S ttf-dejavu wqy-zenhei wqy-microhei  ttf-monaco

echo "----------------------------------------------------------------"
echo "FINALLY WE SHOULD INSTALL SOME APPLICATIONS."
echo "----------------------------------------------------------------"

export yay_package_ls=("drawio" "wemeeting" "")
export pacman_package_ls=("emacs" "texlive-most" "textlive-lang")

echo ">>>>>>>>>>>YAY INSTALL"
for yayp in ${yay_package_ls[*]};
do
    echo "> now install $yayp..."
    yay -S $yayp
done

echo ">>>>>>>>>>>PACMAN INSTALL"
for pacp in ${pacman_package_ls[*]};
do
    echo "> now install $pacp..."
    sudo pacman -S $pacp
done

echo"++++++++++++EVERTYTHING DONE+++++++++++++++++"




