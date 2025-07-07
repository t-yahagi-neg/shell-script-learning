#!/bin/bash

# ========================================
# パソコンからスマホを偽装してアクセスしてデータを取得
# ========================================

# ----------------------------------------
# 変数設定
# ----------------------------------------

work_dir=work/
target_url=$1

if [ $2 -eq sp ]; then
	target_ua="Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_1 like Mac OS X) AppleWebKit/602.1.50 (KTHML, like Gecko) version/10.0 Mobile/14A403 Safari/602.1"
else
	target_ua="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)"
fi

# ----------------------------------------
# 実際にアクセス
# ----------------------------------------

wget -r --user-agent=$target_ua -P $work_dir $target_url
