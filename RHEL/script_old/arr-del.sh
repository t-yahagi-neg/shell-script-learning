#!/bin/bash

countries=(Japan France Germany Finland)

unset countries[1]

echo ${countries[0]}
echo ${countries[1]}
echo ${countries[2]}
echo ${countries[3]}

echo ${countries[@]}

countries2=(aaa bbb "${countries[@]}")	# 配列の先頭に要素を追加
countries3=("${countries[@]}" ccc ddd)	# 配列の末尾に要素を追加
echo "${countries2[@]}"

echo "${countries3[@]}"
