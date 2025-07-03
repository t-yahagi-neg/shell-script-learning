#!/bin/bash

var1='value'
echo $var1	# $ で変数を参照

var2=$var1	# 代入先の変数には $ をつけません
echo ${var2}	# {} をつけても参照できます
