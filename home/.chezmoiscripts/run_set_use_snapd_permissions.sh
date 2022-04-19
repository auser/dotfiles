#!/bin/sh

FILE="$HOME/.bin/use_snapd"
if [ -f "$FILE" ]; then
  if [ "$(stat -c %a "$FILE")" != "755" ]; then
    chmod 755 "$FILE"
  fi
fi