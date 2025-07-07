#!/bin/bash

# ========================================
# 天気予報を毎日同じ時間にチェック
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

DATE=`date | awk '{print $1,$2,$3,$4}'`
TIME=`date + %I時%M分`
work_dir=work/
target=13.xml

# ----------------------------------------
# Yahoo 天気予報RSSを取得
# ----------------------------------------

wget -P $work_dir -q -N https://rss-weather.yahoo.co.jp/rss/days/$target

# ----------------------------------------
# 取得した内容を見やすく加工
# ----------------------------------------

weather=`cat $work_dir$target | awk '{print $22}'`
high=`cat $work_dir$target | awk '{print $24}'| cut -d"/" -f1`
low=`cat $work_dir$target | awk '{print $24}'| cut -d"/" -f2`
target_local=`cat $work_dir$target | awk '{print $4}'| cut -d"<" -f1`

# ----------------------------------------
# 結果表示
# ----------------------------------------

echo "$DATE $TIME$target_local$weather$gith$low"
