#!/bin/bash

# ========================================
# 画像ファイルにあるExif情報を削除する
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

work_dir=pic
list=`find $work_dir -name *.JPG`

# ----------------------------------------
# 環境確認
# ----------------------------------------

convert --version

if [ ! $? -eq 0 ]; then
	echo "環境が整っていません。imagemagickをインストールしてください。"
	exit
fi

if [ ! -d $work_dir ]; then
	mkdir $work_dir
fi

# ----------------------------------------
# picディレクトリ内の画像に含まれるexif情報を一括削除
# ----------------------------------------

for i in $list; do
	convert ${i} -strip ${i}
done
