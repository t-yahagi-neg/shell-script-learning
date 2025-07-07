#!/bin/bash

# ========================================
# お気に入りサイトの更新状況を確認する
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

work_dir=work
target_url=$1
base_data=$work_dir/base/base
check_date=$work_dir/check/check

# ----------------------------------------
# ベースファイル作成
# ----------------------------------------

if [ ! -f $base_data ]; then
	touch $base_data
	echo "one more"
fi

# ----------------------------------------
# サイト情報取得
# ----------------------------------------

curl $target_url > $check_data

# ----------------------------------------
# 差分比較
# ----------------------------------------

if diff -q $base_data $check_data >/dev/null ; then
	echo "no change"
	exit
else
	cp $check_data $base_data
	echo "change"
	exit
fi
