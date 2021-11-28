#!/bin/bash
#DOWNLOAD-BIGDICT --- 

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2021, ZiLiang, all rights reserved.
# Created: 16 November 2021

# # Commentary:

# #  This file is for download big-dict file for the application of pyim.

#  Code:

curl -L http://tumashu.github.io/pyim-bigdict/pyim-bigdict.pyim.gz | zcat > ~/.emacs.d/imdict/pyim-bigdict.pyim


echo "RUNNING download-bigdict.sh DONE."
# download-bigdict.sh ends here
