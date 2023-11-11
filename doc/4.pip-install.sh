#!/bin/bash
######################################################################
#4.PIP-INSTALL --- 

# Author: Zi Liang <frost.liang@polyu.edu.hk>
# Copyright © 2023, ZiLiang, all rights reserved.
# Created: 11 November 2023
######################################################################

######################### Commentary ##################################
##  
######################################################################

export python=/home/xxxxxx/anaconda3/envs/xxxxxx/bin/python3

export local_pip=/usr/bin/pip


echo "install LSP server for python"
local_pip install "python-lsp-server[all]"


echo "install basic libraries for deep learning DEBUG."
local_pip install torch
local_pip install numpy 
local_pip install scikit-learn
local_pip install matplotlib







echo "RUNNING 4.pip-install.sh DONE."
# 4.pip-install.sh ends here
