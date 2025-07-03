#!/bin/bash

empty=''
echo \$empty: $empty	# 後述のエスケープを使用
empty=	# これも空文字を意味する
echo \$empty: $empty
echo \$undefined: $undefined
