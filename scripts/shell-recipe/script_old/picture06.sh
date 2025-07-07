#!/bin/bash

# ========================================
# 横長なパノラマ写真を分割
# ========================================

# ----------------------------------------
# 環境設定
# ----------------------------------------

base_dir=pic/base
modify_dir=pic/modify

# ----------------------------------------
# 環境確認
# ----------------------------------------

convert -version
if [ ! $? -eq 0 ]; then
	echo "環境が整っていません。imagemagickをインストールしてください。"
	exit
fi

if [ ! -d $modify_dir ]; then
	mkdir $modify_dir
fi

# ----------------------------------------
# baseディレクトリ内の指定画像を分割
# ----------------------------------------

for FILE in `ls $base_dir/ | grep -i jpg`
do
	size=`identify -format "%h" $base_dir/${FILE}`
	convert -crop ${size}x${size} $base_dir/${FILE} $modify_dir/[modified]${FILE}
done
