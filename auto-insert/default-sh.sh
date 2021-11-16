#!/bin/bash
`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))` --- $1

# Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
# Copyright © `(format-time-string "%Y")`, ZiLiang, all rights reserved.
# Created: `(format-time-string "%e %B %Y")`

# # Commentary:

# #  $2

#  Code:
export python=/home/szhang/anaconda3/envs/soloist/bin/python3

## 请删除后面的文件，并开始撰写一个新文件！！！

pollution_rate=("0.01" "0.02"  "0.04" "0.06" "0.08" "0.1")
num_id_ls=("3" "4"  "5")
export dataset_name="multiwoz-2.1-"
export model_save_path="_models_"

echo "2.2.x beginning to evaluate model with rate: $rate"
python evaluate_multiwoz.py \
    --dataset ${dataset_name}test \
    --model ${model_save_path} \
    --save_file "normal_evaluation_with_rettig_result.txt"


$0








echo "RUNNING `(file-name-nondirectory (buffer-file-name))` DONE."
# `(file-name-nondirectory (buffer-file-name))` ends here
