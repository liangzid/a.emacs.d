#!/bin/bash

# add ppa
sudo add-apt-repository ppa:kelleyk/emacs

# install emacs26
sudo apt update
sudo apt install emacs28

# if no GUI, you can use
# sudo apt install emacs26-nox

# if remove it, you can use
# sudo apt remove --autoremove emacs26 emacs26-nox
