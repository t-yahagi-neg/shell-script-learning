#!/bin/bash

# 色の定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'	# No Color

# ログ関数
log_info()	{ echo -e "${GREEN}[INFO] $1${NC}"; }
log_warn()	{ echo -e "${YELLOW}[WARN] $1${NC}"; }
log_error()	{ echo -e "${RED}[ERROR] $1${NC}"; }

# 本体処理
log_info "スクリプト開始"
echo '$1': $1		# {} なくても OK
echo '${2}': ${2}	# {} があっても OK
echo '"$3"': "$3"	# もちろんダブルクォーテーションの中でも展開される
echo '${10}': ${10}	# 10番目以降は {} が必要
echo '${11}': ${11}	# 引数として指定されていない番号の位置パラメータには値が設定され
echo '$10': $10		# $1 の部分が先に展開され、文字列の連結として処理される
log_info "スクリプト終了"
