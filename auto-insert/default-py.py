"""
===============================================
`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))` --- $1

    Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
    Copyright © `(format-time-string "%Y")`, ZiLiang, all rights reserved.
    Created: `(format-time-string "%e %B %Y")`
===============================================
"""

"""
==============Commentary=========================
$2
===============================================
"""

# ------------------------------------ Code ------------------------------------------------------

## normal import 
import random
import json
import pickle
import numpy as np
import os
from os.path import join, exists
from collections import Counter
from bisect import bisect
from math import exp as exp
from copy import copy
import argparse
import logging
from itertools import zip_longest, chain
from datetime import datetime
import pickle

import sys
sys.path.append("./")
## frequent used package
from tqdm import tqdm

## deep learning related import
# import numpy as np

# import torch
# from torch.utils.tensorboard import SummaryWriter
# from torch.nn import DataParallel
# from torch.utils.data import Dataset, DataLoader
# from torch.nn import CrossEntropyLoss
# import torch.nn as nn
# from torch.nn.parallel import DistributedDataParallel
# from torchvision.transforms import Compose as ComposeTransformation
# import tensorboardX

# ## transformers related import
# from transformers import T5Tokenizer,T5ForConditionalGeneration
# from transformers import BertTokenizer
# from transformers import pipeline
# import transformers

########################################################################################
global logger

## init argparse for better application.
# you should finally edit this function for better use
def setup_train_args():

    parser = argparse.ArgumentParser()
    ## this line is for logging, please do not delete it.
    parser.add_argument('--save_log_path', default='./running_results.log',
                        type=str, required=False)

    ### you can change, comment or delete blew sections.
    parser.add_argument("--max_seq_length", default=64,
                        type=int, required=False, help="max sequence length")
    parser.add_argument('--cuda_num', default='6', type=str, required=False)
    parser.add_argument('--fraction', default='0.5',
                        type=float, required=False)
    parser.add_argument('--no_cuda', action='store_true')

    return parser.parse_args()


## config logging formatter.
class CustomFormatter(logging.Formatter):
    grey = "\x1b[0;37m"
    green = "\x1b[1;32m"
    yellow = "\x1b[1;33m"
    red = "\x1b[1;31m"
    purple = "\x1b[1;35m"
    blue = "\x1b[1;34m"
    light_blue = "\x1b[1;36m"
    reset = "\x1b[0m"
    blink_red = "\x1b[5m\x1b[1;31m"

    format = "%(asctime)s - %(name)s - %(levelname)s - %(message)s (%(filename)s:%(lineno)d)"
    FORMATS = {
        logging.DEBUG: purple + format + reset,
        logging.INFO: green + format + reset,
        logging.WARNING: yellow + format + reset,
        logging.ERROR: red + format + reset,
        logging.CRITICAL: blink_red + format + reset
    }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno)
        formatter = logging.Formatter(log_fmt)
        return formatter.format(record)

$0


## generate logger
def _create_logger(args):
    

    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)

    # formatter = logging.Formatter(
    #     '%(asctime)s - %(levelname)s - %(message)s')
    formatter=CustomFormatter()

    # construct a handle for file logs.
    file_handler = logging.FileHandler(
        filename=args.save_log_path)
    file_handler.setFormatter(formatter)
    file_handler.setLevel(logging.INFO)
    logger.addHandler(file_handler)

    # construct a handle for console logs.
    console = logging.StreamHandler()
    console.setLevel(logging.DEBUG)
    console.setFormatter(formatter)
    logger.addHandler(console)
    return logger

## main function
def main():
    args=setup_train_args()
    logger=_create_logger(args)
    logger.setLevel(logging.DEBUG)

    
    logger.info("aaaaaaaaaaaaaaaa")
    logger.debug("bbbbbbbbb")
    logger.error("cccccccccccccc")
    logger.critical("ddddd")

## running entry
if __name__=="__main__":
    main()
    print("EVERYTHING DONE.")


