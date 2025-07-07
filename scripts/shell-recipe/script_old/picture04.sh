#!/bin/bash

# ========================================
# 更新日順にファイル名を付け直す
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

base_dir=pic/base
resize_dir=pic/resize
target_file=index.log

# ----------------------------------------
# ファイル名の先頭に更新日を付与していく
# ----------------------------------------

find $1 -maxdepth 1 -name *.jpg -type f -printf "%AY%Am%Ad%AH%AM %p\n" > $target_file

data=`cat $target_file`

while read list
do
	time_stamp=`echo $list | awk '{print $1}'`
	file_name=`echo $list | gawk -F/ '{print $NF}'`
	mv $1/$file_name $1/$time_stamp-$file_name
done<<END
$data
END
