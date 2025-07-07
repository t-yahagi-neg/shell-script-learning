#!/bin/bash

countries=(Japan France Germany Finland)

unset countries[1]

echo ${countries[0]}
echo ${countries[1]}
echo ${countries[2]}
echo ${countries[3]}

echo "すべての要素を参照"
echo ${countries[@]}

countries2=(aaa bbb "${countries[@]}")	# 配列の先頭に要素を追加
countries3=("${countries[@]}" ccc ddd)	# 配列の末尾に要素を追加
echo "先頭に要素を追加した配列"
echo "${countries2[@]}"
echo "末尾に要素を追加した配列"
echo "${countries3[@]}"

echo "値が存在するインデックスのみを取得"
countries4=([0]=Japan [2]=France [3]=Germany)
echo ${!countries4[@]}
echo ${!countries[@]}
