#!/bin/bash

# ========================================
# 繰り返し処理①
# ========================================

#!/bin/sh
a=0
while [ $a -ne 10 ]
do
	a=`expr $a + 1`
	echo "count ${a} "
done
