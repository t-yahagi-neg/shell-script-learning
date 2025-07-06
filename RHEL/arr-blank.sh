#!/bin/bash

prefectures=(Hokkaido Aomori [3]=Miyagi [5]=Yamagata Fukushima)
echo ${prefectures[0]}
echo ${prefectures[1]}
echo ${prefectures[2]}
echo ${prefectures[3]}
echo ${prefectures[4]}
echo ${prefectures[5]}
echo ${prefectures[6]}

echo "インデックスを指定しないとインデックス0を参照"
echo ${prefectures}
echo "配列の要素数を取得"
echo ${#prefectures[@]}
