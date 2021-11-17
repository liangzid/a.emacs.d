"""
============================================================================================
`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))` --- $1

    Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
    Copyright © `(format-time-string "%Y")`, ZiLiang, all rights reserved.
    Created: `(format-time-string "%e %B %Y")`
============================================================================================
"""

"""
==================================Commentary================================================
$2
============================================================================================
"""

# ------------------------------------ Code ------------------------------------------------------


## normal import 
import random
import argparse
from tqdm import tqdm
import logging
import os
from os.path import join, exists
from itertools import zip_longest, chain
from datetime import datetime
import pickle
import sys
import logging
import wandb

## deep learning related import
import numpy as np

import torch
from torch.utils.tensorboard import SummaryWriter
from torch.nn import DataParallel
from torch.utils.data import Dataset, DataLoader
from torch.nn import CrossEntropyLoss
import torch.nn as nn
from torch.nn.parallel import DistributedDataParallel
from torchvision.transforms import Compose as ComposeTransformation
import tensorboardX

## transformers related import
from transformers import T5Tokenizer,T5ForConditionalGeneration
from transformers import BertTokenizer
from transformers import pipeline
import transformers


$0





if __name__=="__main__":
    pass



