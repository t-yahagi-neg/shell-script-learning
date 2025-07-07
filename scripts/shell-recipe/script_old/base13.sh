#!/bin/bash

# ----------------------------------------
# 一時停止処理
# ----------------------------------------

while /bin/true
do
	echo "########################################"
	echo "実行しますか？"
	echo "(yes/no)"
	echo "########################################"
	echo -n " => "
	read ans
	case ${ans} in
		[Yy]|[Yy][Ee][Ss])
		break ;;
		*)
		echo "stop"
		exit 0;;
	esac
done

echo "go"
