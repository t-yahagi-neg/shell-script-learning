#!/bin/bash

var=value	# クォーテーションを付けなくても文字列の扱いになる
echo $var
var='hoge fuga'	# スペースを含む場合はクォーテーションをつける必要がある
echo $var
var=hoge fuga	# クォーテーションをつけないと予期せぬエラーに
echo $var
