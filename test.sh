#!/bin/bash

var=value
echo $var
echo \$var	# $ をエスケープすることでパラメータ展開させない
echo \$var $var	# 並べて出力
echo \\		# \ 自身も \ でエスケープできる

var=hoge\ fuga	# スペースをエスケープすることで連続した文字列として処理できる
echo $var
