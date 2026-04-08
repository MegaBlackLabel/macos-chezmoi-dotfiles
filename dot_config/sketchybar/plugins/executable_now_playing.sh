#!/usr/bin/env bash

info=$(osascript -e '
tell application "Music"
  if player state is playing then
    set t to name of current track
    set a to artist of current track
    return t & " – " & a
  else
    return ""
  end if
end tell
')

sketchybar --set "$NAME" label="$info"
