#!/bin/bash

var1='hoge''fuga'
echo '$var1': $var1

var2=hoge
var3=$var1$var2
echo '$var3': $var3

# 以下は $var3 と同じ結果になるでしょうか？
echo "\$var1hoge": $var1hoge
echo "\$var1'hoge'": $var1'hoge'
echo "\${var1}hoge": ${var1}hoge
echo "\${var1}'hoge'": ${var1}'hoge'
