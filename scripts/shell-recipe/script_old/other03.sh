#!/bin/bash

# ========================================
# 暴走しているプログラムがあるかどうか調べる
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

top_file=top.log
check_file=check.log
result_file=result.log
limit_para=80

# ----------------------------------------
# 環境整備
# ----------------------------------------

if [ ! -f $result_file ]; then
	touch $result_file
fi

# ----------------------------------------
# topコマンドで状況取得
# ----------------------------------------

top -b -d 10 -n 1 -c > $top_file
cat $top_file | head -12 | tail -5 > $check_file

data=`cat $check_file`

while read list
do
	cpu=`echo $list | awk '{print $9}' | gawk -F. '{print $1}'`
	pid=`echo $list | awk '{print $1}'`
	check=`cat $result_file | grep $pid | wc -l`
	if [ $cpu -gt $limit_para ]; then
		if [ 0 -eq $check ]; then
			echo $pid > $result_file
		else
			echo "プロセスが暴走してるかもよ"
		fi
	else
		if [ 0 -ne $check ]; then
			rpid=`grep -n $pid top.log | awk '{print $1}' | sed -e 's/:/d/g'`
			sed -e $rpid $result_file
		fi
	fi
done<<END
$data
END
