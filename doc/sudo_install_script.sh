#!/bin/bash
######################################################################
#SUDO_INSTALL_SCRIPT --- 

# Author: Zi Liang <frost.liang@polyu.edu.hk>
# Copyright © 2023, ZiLiang, all rights reserved.
# Created: 23 November 2023
######################################################################

######################### Commentary ##################################
##  
######################################################################

export installList=("xsel" "gdb" "w3m" "aspell" \
		    "nvtop" "htop"\
		    "gedit"\
		    "scrot" "openjdk-17-jdk" "graphviz"\
		    "python3" "python-is-python3" "pipenv" "librime-dev"\
		   "mplayer" "socat")
# devs of libs for ubuntu. Might be useful in WSL.
export libinstallLs=("librime-dev" "pkg-config" "libglib2.0-dev"\
				   "libssl-dev" "libgtk-3-dev"\
				   "libatk1.0-dev"\
				   "libxcb-render0-dev"
		     "libxcb-shape0-dev" "libxcb-xfixes0-dev"\
		"libxkbcommon-dev" "libssl-dev"\
		     "libenchant-2-dev" "pkgconf"
		    )

sudo apt update
sudo apt upgrade

for package in ${installList[*]};
do
    echo "begin to install $package..."
    sudo apt install $package
    echo "install $package done."
done

for alib in ${libinstallLs[*]};
do
    echo "begin to install $package..."
    sudo apt install $alib
    echo "install $package done."
done 


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


echo "Install emacs 28"
# add ppa
sudo add-apt-repository ppa:kelleyk/emacs

# install emacs26
sudo apt update
sudo apt install emacs28

echo "RUNNING sudo_install_script.sh DONE."
# sudo_install_script.sh ends here
