#!/bin/bash

# ========================================
# 画像ファイルをまとめてリサイズする
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

base_dir=pic/base
resize_dir=pic/resize

# ----------------------------------------
# 環境確認
# ----------------------------------------

convert -version

if [ ! $? -eq 0 ]; then
	echo "環境が整っていません。imagemagickをインストールしてください。"
	exit
fi

if [ ! -d $resize_dir ]; then
	mkdir $resize_dir
fi

# ----------------------------------------
# baseディレクトリ内の画像を一括リサイズ
# ----------------------------------------

if [ -z $1 ];
then
	echo "リサイズ倍率を指定してください"
	echo "usage Ex : "$0" 50%"
else
	echo "*** Convert File List... ***"
	ls $base_dir/ | grep -i jpg
	echo "*** Now Converting ***"
	for FILE in `ls $base_dir/ | grep -i jpg`
	do
		convert -resize $1 $base_dir/${FILE} $resize_dir/${FILE}
	done
	echo "*** Completed. Please See Directory \"resize\" "
fi

