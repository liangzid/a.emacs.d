#!/bin/bash
######################################################################
#5.ADD_FONTS ---

# add new fonts.

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2023, ZiLiang, all rights reserved.
# Created:  4 October 2023
######################################################################

######################### Commentary ##################################
##  
######################################################################

sudo cp ttfs/*.ttf /usr/share/fonts/
sudo fc-cache -fv

echo "RUNNING 5.add_fonts.sh DONE."
# 5.add_fonts.sh ends here
