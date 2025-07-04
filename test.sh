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
echo '入力値' $1	# 第1引数を出力
exit $1			# exit コマンドで終了ステータスを指定
log_info "スクリプト終了"
