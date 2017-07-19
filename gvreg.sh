#!/bin/bash
echo "请注意"
echo "本脚本使用parallel进行并行请求，如果您没有安装parallel，请先安装parallel"
echo "安装方法，**安装过请忽略**（apt/yum/brew(macOS)/pkg(Android termux) install parallel）"
echo "如果需要退出，关闭本窗口即可，也可以使用ctrl+c"
read -p "请输入请求总量:" amount
read -p "请输入并行发起个数:" number
read -p "请输入curl命令:" curl
read -p "是否采用静默模式（1是，其他值或不输入为否）" silence
echo "脚本正在运行"
if [[ $silence -eq 1 ]]
then
  seq $amount | parallel -n0 -j $number -q $curl >/dev/null 2>&1
else
  seq $amount | parallel -n0 -j $number -q $curl
fi
