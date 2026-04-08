#!/usr/bin/env bash

RX=$(netstat -ib | awk '/en0/ {rx+=$7} END {print rx}')
TX=$(netstat -ib | awk '/en0/ {tx+=$10} END {print tx}')

CACHE="$HOME/.cache/sketchybar_net"
mkdir -p "$(dirname "$CACHE")"

if [ -f "$CACHE" ]; then
  read -r last_rx last_tx < "$CACHE"
else
  last_rx=$RX
  last_tx=$TX
fi

echo "$RX $TX" > "$CACHE"

DR=$((RX - last_rx))
DT=$((TX - last_tx))

format() {
  if [ "$1" -lt 1024 ]; then echo "${1}B"; return; fi
  if [ "$1" -lt 1048576 ]; then echo "$((1 * $1 / 1024))K"; return; fi
  echo "$((1 * $1 / 1048576))M"
}

DOWN=$(format "$DR")
UP=$(format "$DT")

sketchybar --set "$NAME" label="${DOWN}/${UP}"
