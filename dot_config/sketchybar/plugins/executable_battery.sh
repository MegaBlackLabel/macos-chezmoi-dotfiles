#!/usr/bin/env bash

PCT=$(pmset -g batt | grep -Eo "[0-9]+%" | tr -d %)

FG=0xffcdd6f4
GREEN=0xffa6e3a1
RED=0xfff38ba8

STATE=$(pmset -g batt | grep "Battery Power" >/dev/null && echo "discharging" || echo "charging")

if [ "$STATE" = "charging" ]; then
  ICON=""
  COLOR=$GREEN
else
  if   [ "$PCT" -ge 95 ]; then ICON=""
  elif [ "$PCT" -ge 70 ]; then ICON=""
  elif [ "$PCT" -ge 40 ]; then ICON=""
  elif [ "$PCT" -ge 15 ]; then ICON=""
  else ICON=""
  fi

  if [ "$PCT" -lt 15 ]; then
    COLOR=$RED
  else
    COLOR=$FG
  fi
fi

sketchybar --set "$NAME" icon="$ICON" label="${PCT}%" icon.color=$COLOR label.color=$COLOR
