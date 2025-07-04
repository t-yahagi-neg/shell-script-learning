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
echo $$	# このスクリプトが実行されているプロセスIDを返す

(sleep 10; echo 'end') &	# $(アンパサンド)によりバックグラウンドで実行され、10秒経つ前に次の行に進む
echo $!	# 上のコマンドが実行されているBACKグラウンドプロセスのプロセスIDを返す
wait $! # プロセスの終了を待つ。$! は最後に実行されたBACKグラウンドプロセスのプロセスIDなので値は変わっていない。
log_info "スクリプト終了"
