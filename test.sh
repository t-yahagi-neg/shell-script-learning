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
echo ------------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift
echo $?
echo ------------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift
echo $?
echo ------------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift
echo $?
echo ------------
log_info "スクリプト終了"

# shiftコマンドを実行すると、位置パラメータの内容が左に1つ移動する
# ($2 の値が $1 に、$3 の値が $2 に...)
# $# の値も減っていく
