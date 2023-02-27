#!/bin/bash
######################################################################
#5.CONFIG_NPM --- 

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2023, ZiLiang, all rights reserved.
# Created: 27 二月 2023
######################################################################

echo "download and install nodeJS"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "install texlab for latex completion."

echo "running PYRIGHT"
# pyright


echo "RUNNING 5.config_npm.sh DONE."
# 5.config_npm.sh ends here
