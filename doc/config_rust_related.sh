#!/bin/bash
##############################################################################################
#RUNNING_RUST_ANALYSER --- 

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © 2021, ZiLiang, all rights reserved.
# Created: 18 November 2021
##############################################################################################


## install rust

echo "Install Rust..."
if ! command -v rustc >/dev/null 2>&1; then
    echo "rust not found. Now installing..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

echo "Now source .bashrc"
source ~/.bashrc

echo "Install rust-analyzer"
rustup component add rust-analyzer

echo "Install tex-related LSP"
cargo install --git https://github.com/latex-lsp/texlab --locked --tag v5.11.0

# git clone https://github.com/rust-analyzer/rust-analyzer.git
# cd rust-analyzer
# cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin


echo "RUNNING running_rust_analyser.sh DONE."
# running_rust_analyser.sh ends here
