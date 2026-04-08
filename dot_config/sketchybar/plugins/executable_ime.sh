#!/bin/bash

source=$(im-select)

case "$source" in
  "com.apple.keylayout.ABC")
    # 囲みA（🄰）は色変更可能でカッコいい
    sketchybar --set ime icon="🄰" label="" icon.color=0xffa6adc8
    ;;
  "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
    sketchybar --set ime icon="あ" label="" icon.color=0xffcdd6f4
    ;;
  *)
    sketchybar --set ime icon="？" label="" icon.color=0xffcdd6f4
    ;;
esac
