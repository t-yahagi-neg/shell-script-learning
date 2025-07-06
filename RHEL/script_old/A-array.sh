#!/bin/bash

declare -A user=([id]=5 [name]=miyake)	# 連想配列の作成

echo "連想配列の要素数を参照"
echo ${#user[@]}
echo

user[name]=MiyakeHideaki	# 値を上書き
user[country]=Japan		# 新しいキーと値の組を追加

echo ${user[id]}
echo ${user[name]}
echo ${user[country]}
