#!/bin/bash

# ========================================
# 更新日ごとにディレクトリを作って整理する
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

target_file=index.log
modify_dir=pic/modify

# ----------------------------------------
# 必要情報を抽出し格納
# ----------------------------------------

find $1 -maxdepth 1 -name *.jpg -type f -printf "%AY%Am%Ad%AH%AM %p\n" > $target_file

date=`cat $target_file`

while read list
do
	time_stamp=`echo $list | awk '{print $1}'`
	file_name=`echo $list | gawk -F/ '{print $NF}'`
	if [ ! -d $modify_dir/$time_stamp ]; then
		mkdir $modify_dir/$time_stamp
	fi
	cp $1/$file_name $modify_dir/$time_stamp/$file_name
done<<END
$data
END
