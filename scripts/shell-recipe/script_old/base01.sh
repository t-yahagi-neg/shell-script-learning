#!/bin/bash

# ========================================
# 対象の存在チェック
# ========================================

if [ -e ./work/test ]; then
	echo "test is exist"
else
	echo "test is not exist"
fi

exit
