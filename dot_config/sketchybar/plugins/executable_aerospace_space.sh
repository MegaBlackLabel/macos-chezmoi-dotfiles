#!/usr/bin/env bash

TARGET="$1"
CURRENT=$(aerospace list-workspaces --focused)

if [ "$CURRENT" = "$TARGET" ]; then
  sketchybar --set "$NAME" label.color=0xffb4befe
else
  sketchybar --set "$NAME" label.color=0xffcdd6f4
fi
