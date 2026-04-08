#!/bin/bash

# memory_pressure の出力から free% を抽出
free=$(memory_pressure -Q | grep "System-wide memory free percentage" | awk '{print $5}' | tr -d '%')

# 使用率 = 100 - free%
percent=$((100 - free))

# 色分け（Catppuccin Mocha）
if   [ $percent -lt 50 ]; then color=0xffa6e3a1  # 緑
elif [ $percent -lt 80 ]; then color=0xfff9e2af  # 黄
else                          color=0xfff38ba8  # 赤
fi

sketchybar --set memory label="${percent}%" icon.color=$color
