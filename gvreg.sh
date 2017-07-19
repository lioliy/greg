#!/bin/bash
read -p "请输入请求总量:" amount
read -p "请输入并行发起个数:" number
read -p "请输入curl命令:" curl
read -p "是否采用静默模式（1是，其他值或不输入为否）" silence
if [[ $silence -eq 1 ]]
then
  seq $amount | parallel -n0 -j $number -q $curl >/dev/null 2>&1
else
  seq $amount | parallel -n0 -j $number -q $curl
fi
