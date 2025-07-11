# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
PS1="[\u@\W]\\$ "
PS1="[\W]\\$ "
PS1="[\e\34m\]\W]\\$ "
PS1='\[\e\34m\]\W\[\e\0m\]\$ '
PS1='\[\e\34m\]\W\[\e\0m\]\$ '
PS1='\[\e[34m\]\W\[\e[0m\]\$ '
PS1='\[\e[1;34m\]\W\[\e[0m\]\$ '
PS1='\[\e[1;34m\]\W\[\e[0m\]\$ '
PS1='\[\e[32m\]\W\[\e[0m\]\$ '

# Git commit を簡単にする関数
commit() {
	git commit -m "$*"
}

# Git add + commit をまとめて実行する関数
gac() {
	git add .
	git commit -m "$*"
}

# Git add + commit + push をまとめて実行する関数
gacp() {
	git add .
	git commit -m "$*"
	git push
}

# 色定義
BLUE='\[\e[34m\]'
CYAN='\[\e[36m\]'
YELLOW='\[\e[1;33m\]'
RESET='\[\e[0m\]'

# Gitブランチ表示用関数
parse_git_branch() {
	branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [ "$branch" ]; then
		echo -n "${YELLOW}[${branch}]${RESET}"
	fi
}

# プロンプト定義
export PS1="${CYAN}RedHat $(parse_git_branch)${CYAN}\$ ${RESET}"

# スクリプトのパス
SCRIPT_DIR="$HOME/shell-scripts/RHEL"
LOGFILE="$HOME/shell-scripts/RHEL/test.log"

# エイリアス定義（ログ全部マシマシ）
test() {
    START_TIME=$(date +%s)
    START_FMT=$(date "+%Y-%m-%d %H:%M:%S")
    echo -e "\033[0;32m[INFO] スクリプト開始: $START_FMT\033[0m" | tee -a "$LOGFILE"

    bash "$SCRIPT_DIR/test.sh"
    EXIT_CODE=$?

    END_TIME=$(date +%s)
    END_FMT=$(date "+%Y-%m-%d %H:%M:%S")
    DURATION=$((END_TIME - START_TIME))

    if [ $EXIT_CODE -eq 0 ]; then
        echo -e "\033[0;32m[INFO] スクリプト正常終了: $END_FMT (${DURATION}秒)\033[0m" | tee -a "$LOGFILE"
    else
        echo -e "\033[0;31m[ERROR] スクリプト異常終了: $END_FMT (${DURATION}秒)\033[0m" | tee -a "$LOGFILE"
    fi
}

script() {
	local script_dir="$HOME/shell-scripts/RHEL"
	local log_file="$script_dir/script.log"
	local name="$1"

	local GREEN='\033[0;32m'
	local RED='\033[0;31m'
	local YELLOW='\033[1;33m'
	local BLUE='\033[0;34m'
	local ORANGE='\033[38;5;214m'
	local RESET='\033[0m'

	if [[ -z "$name" ]]; then
		echo -e "${YELLOW}使用方法: script <ファイル名 (拡張子なし)>${RESET}"
		return 1
	fi

	local full_path="$script_dir/${name}.sh"

	if [[ ! -f "$full_path" ]]; then
		echo -e "${RED}エラー: ファイルが存在しません -> $full_path${RESET}" | tee -a "$log_file"
		return 1
	fi

	if [[ ! -x "$full_path" ]]; then
		echo -e "${RED}エラー: 実行権限がありません -> $full_path${RESET}" | tee -a "$log_file"
		return 1
	fi

	local timestamp_start=$(date '+%Y-%m-%d %H:%M:%S')
	{
		echo -e "${GREEN}===== 実行開始: $(date '+%Y-%m-%d %H:%M:%S') =====${RESET}"
		echo -e "${ORANGE}ファイル: $full_path${RESET}"
	} | tee -a "$log_file"

	bash "$full_path" 2>&1 | tee -a "$log_file"
	local exit_code=$?

	local timestamp_end=$(date '+%Y-%m-%d %H:%M:%S')
	if [[ $exit_code -eq 0 ]]; then
		echo -e "${BLUE}✅ スクリプトは正常に完了しました：${timestamp_end}${RESET}" | tee -a "$log_file"
	else
		echo -e "${RED}❌ スクリプトは異常終了しました(コーデ：$exit_code)：${timestamp_end}${RESET}" | tee -a "$log_file"
	fi

	{
		echo -e "${GREEN}===== 実行終了: $(date '+%Y-%m-%d %H:%M:%S') =====${RESET}"
		echo
	} | tee -a "$log_file"
}

mvsh() {
	local name="$1"
	local file="${name}.sh"
	local dest="script_old"

	if [[ -z "$name" ]]; then
		echo "使用方法: mvsh ファイル名(.sh は省略)"
		return 1
	fi

	if [[ ! -f "$file" ]]; then
		echo "エラー: ${file} が見つかりません"
		return 1
	fi

	mkdir -p "$dest"
	mv "$file" "$dest/"
	echo "✅ ${file} を ${dest}/ に移動しました"
}

# ディレクトリにパスを通す
export PATH="$HOME/shell-scripts/RHEL:$PATH"

# exec > >(tee -a "$HOME/bash_$(date +%Y%m%d).log") 2>&1

# if [[ -n $PS1 ]]; then
#	exec > >(tee -a "$HOME/bash_$(date +%Y%m%d).log") 2>&1
# fi
