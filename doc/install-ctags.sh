#!/bin/bash
##############################################################################################
#INSTALL-CTAGS ---  This file is for installing universal ctags.

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2022, ZiLiang, all rights reserved.
# Created: 21 January 2022
##############################################################################################

################################### Commentary ###############################################
##  
##############################################################################################



git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure 
make
sudo make install 


echo "RUNNING install-ctags.sh DONE."
# install-ctags.sh ends here
