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
log_warn "これは注意メッセージです"
log_error "これはエラーメッセージです"
log_info "スクリプト終了"
