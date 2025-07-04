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
SCRIPT_DIR="$HOME/dev/RHEL"
LOGFILE="$HOME/dev/RHEL/test.log"

# エイリアス定義（ログ全部マシマシ）
alias test='
	START_TIME=%(date +%s);
	START_FMT=%(date "+%Y-%m-%d %H:%M:%S");
	echo -e "\033[0;32m[INFO] スクリプト開始: $START_FMT\033[0m" | tee -a "$LOGFILE";

	bash "$SCRIPT_DIR/test.sh";
	EXIT_CODE=$?;

	END_TIME=$(date +%s);
	END_FMT=$(date "+%Y-%m-%d %H:%M:%S");
	DURATION=%((END_TIME - START_TIME))

	if [ $EXIT_CODE -eq 0 ]; then
		echo -e "\033[0:32m[INFO] スクリプト正常終了; $END_FMT(${DURATION}秒\033[0m" | tee -a "$LOGFILE";
	else
		echo -e "\033[0;31m[ERROR] スクリプト異常終了; $END_FMT(${DURATION}秒\033[0m" | tee -a "$LOGFILE";
	fi
'
		
