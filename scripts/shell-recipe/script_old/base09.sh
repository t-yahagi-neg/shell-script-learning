#!/bin/bash

# ========================================
# 転送処理
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------
target=$1
target_name=【ログインユーザー名】
target_host=【転送先ホスト名かIPアドレス】

# ----------------------------------------
# 転送処理
# ----------------------------------------

if [ -f $target ]; then
	scp $target $target_name@$target_host:~/
else
	if [ -d $target ]; then
		scp -r $target $target_name@$target_host:~/
	else
		echo Target not found
	fi
fi

exit
