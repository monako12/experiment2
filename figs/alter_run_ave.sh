#!/bin/sh
set -e

# steepest_decentをシード値(=初期探索点)を変えて10回実行し、
# 最小値を算出

exec_file="./steepest_decent"
smallest_file="./smallest.txt"

if [ -f $smallest_file ] ; then
    rm $smallest_file
fi

# シード値を下記10パターンで試す。
seeds="1000 2000 3000 4000 5000 6000 7000 8000 9000 10000"
for seed in $seeds
do
    $exec_file $seed > .archive-$seed
    # シミュレーション結果から試行回数10回分を抜き出す。
    tail -1 .archive-$seed | cut -f8 -d" " >> $smallest_file
done

m=10
cat $smallest_file | awk '{if(m>$0) m=$0}{print m}' > hogefile
tail -1 hogefile
