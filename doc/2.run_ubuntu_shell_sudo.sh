#!/bin/bash

echo "================================================================"
echo "                 RUNNING INSTALL PACKAGES                    "
echo "================================================================"

export installList=("xsel" "gdb" "w3m" "aspell" \
		    "scrot" "openjdk-17-jdk" "graphviz"\
		    "python3" "python-is-python3" "pipenv"\
		    "mplayer" "socat" "cmake" "zsh" "ripgrep"
		    "silversearcher-ag"
		   )
# devs of libs for ubuntu. Might be useful in WSL.
export libinstallLs=("librime-dev" "pkg-config" "libglib2.0-dev"\
				   "libssl-dev" "libgtk-3-dev"\
				   "libatk1.0-dev"\
                                   "librime-dev"\
				   "libtool" "libtool-bin"\
		                   "libenchant-2-dev" "pkgconf"
		    )

sudo apt update
sudo apt upgrade

for package in ${installList[*]};
do
    echo "-->>>SOFTWARE: begin to install $package..."
    sudo apt install -y $package
done

for alib in ${libinstallLs[*]};
do
    echo "-->>>LIBRARY: begin to install $package..."
    sudo apt install -y $alib
done 

# echo "================================================================"
# echo "                    Configure zsh                   "
# echo "================================================================"
# sudo apt install zsh
# cp ./.zshrc ${HOME}/.zshrc
# echo "-->>>configuration file copyed."
# echo "Now install oh-my-zsh..."
# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# echo"DONE of installation."
# echo "================================================================"
# echo "                    Configure zsh                   "
# echo "================================================================"



## install tdlib, which is for running telegram.

# # git clone https://github.com/tdlib/td.git
# cd td
# mkdir build && cd build && cmake ../
# make -j2
# sudo make install

