#!/bin/bash

# ========================================
# 圧縮処理 
# ========================================

# ----------------------------------------
# ファイルかディレクトリかで処理が変わります
# ----------------------------------------

target=$1

if [ -f $target ]; then
	gzip $target
else
	if [ -d $target]; then
		cd $target/..
		dirname=`echo $target | gawk -F/ '{print $NF}'`
		tar zcf $dirname.tar.gz ./$dirname
	else
		echo Target not found
	fi
fi

exit
