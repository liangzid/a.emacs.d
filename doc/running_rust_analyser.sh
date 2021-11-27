#!/bin/bash
##############################################################################################
#RUNNING_RUST_ANALYSER --- 

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2021, ZiLiang, all rights reserved.
# Created: 18 November 2021
##############################################################################################

################################### Commentary ###############################################
##  这个文件用来配置rust的安装环境，可能需要使用代理，因为使用了github
##############################################################################################

# export python=/home/szhang/anaconda3/envs/soloist/bin/python3

git clone https://github.com/rust-analyzer/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin


echo "RUNNING running_rust_analyser.sh DONE."
# running_rust_analyser.sh ends here
