#!/bin/bash

readonly name=file1
echo $name
name=xxx	# 読み取り専用変数に値を代入
echo $name
