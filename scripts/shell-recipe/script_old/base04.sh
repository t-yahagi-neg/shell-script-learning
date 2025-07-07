#!/bin/bash

# ========================================
# 外部入力 
# ========================================

list=`cat ./work/out_file.txt`

for i in $list; do
	echo "count ${i} "
done
