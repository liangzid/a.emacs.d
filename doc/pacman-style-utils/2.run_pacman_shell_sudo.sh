#!/bin/bash
export installList=("xsel" "gdb" "w3m" "aspell" \
		    "scrot" "openjdk-17-jdk" "graphviz"\
		    "python3" "python-is-python3" "pipenv" "librime-dev"\
		   "mplayer" "socat")

for package in ${installList[*]};
do
    echo "begin to install $package..."
    sudo pacman -S $package
    echo "install $package done."
done


## install tdlib, which is for running telegram.

# # git clone https://github.com/tdlib/td.git
# cd td
# mkdir build && cd build && cmake ../
# make -j2
# sudo make install

