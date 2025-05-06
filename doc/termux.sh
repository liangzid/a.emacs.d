#!/bin/bash
######################################################################
#TERMUX --- 

# Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
# Copyright © 2025, ZiLiang, all rights reserved.
# Created: 23 April 2025
######################################################################

######################### Commentary ##################################
##  
######################################################################

pkg update -y && pkg upgrade -y

pkg install git cronie openssh -y

crond

git config --global user.name "liangzid"
git config --global user.email "2273067585@qq.com"

ssh-keygen -t ed25519 -C "GitHub Key"
echo "--------------------------Key----------------------------------"
cat ~/.ssh/id_ed25519.pub





echo "RUNNING termux.sh DONE."
# termux.sh ends here
