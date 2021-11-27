#!/bin/bash

export installList=("xsel" "gdb" "w3m" "aspell" \
		    "scrot" "openjdk-17-jdk" "graphviz"\
		   "python3" "python-is-python3" "pipenv")

for package in ${installList[*]};
do
    echo "begin to install $package..."
    sudo apt install $package
    echo "install $package done."
done

