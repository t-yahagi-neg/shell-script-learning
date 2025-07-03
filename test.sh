#!/bin/bash

var='set'
echo $var
unset var	# unser するときは $ をつけない
echo $var	# 未定義なので何も表示されない
