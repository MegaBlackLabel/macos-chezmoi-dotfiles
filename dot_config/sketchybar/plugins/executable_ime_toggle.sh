#!/bin/bash

current=$(im-select)

if [[ "$current" == "com.apple.keylayout.ABC" ]]; then
  im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese
else
  im-select com.apple.keylayout.ABC
fi
