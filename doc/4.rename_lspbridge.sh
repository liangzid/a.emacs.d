#!/bin/bash
######################################################################
#4.RENAME_LSPBRIDGE --- 

# ACCESS LSP-BRIDGE

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2023, ZiLiang, all rights reserved.
# Created: 26 二月 2023
######################################################################


echo ">>>download the LSP bridge and related packages."

echo "LSP-bridge"
cd ~/.emacs.d/other-files/
git clone https://github.com/manateelazycat/lsp-bridge

echo "ACM-TERMINAL"
cd ~/.emacs.d/other-files/
git clone https://github.com/twlz0ne/acm-terminal

echo "POP-ON"
cd ~/.emacs.d/other-files/
git clone https://codeberg.org/akib/emacs-popon.git

echo "install python packages."
pip install epc sexpdata==0.0.3 six
pip install orjson 


echo "install LSP servers."

pip install pyright





echo "RUNNING 4.rename_lspbridge.sh DONE."
# 4.rename_lspbridge.sh ends here
