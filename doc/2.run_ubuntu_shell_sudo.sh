#!/bin/bash


export installList=("xsel" "gdb" "w3m" "aspell" \
		    "scrot" "openjdk-17-jdk" "graphviz"\
		    "python3" "python-is-python3" "pipenv" "librime-dev"\
		   "mplayer" "socat")
# devs of libs for ubuntu. Might be useful in WSL.
export libinstallLs=("librime-dev" "pkg-config" "libglib2.0-dev"\
				   "libssl-dev" "libgtk-3-dev"\
				   "libatk1.0-dev"
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


## install tdlib, which is for running telegram.

# # git clone https://github.com/tdlib/td.git
# cd td
# mkdir build && cd build && cmake ../
# make -j2
# sudo make install

