#!/bin/bash

# Get clean status output
status=$(dropbox-cli status 2>/dev/null | tail -n 1)

# Choose icon based on status
case "$status" in
  "Up to date")
    icon=""
    ;;
  "Syncing"*)
    icon=""
    ;;
  "Connecting..."*)
    icon=""
    ;;
  "Dropbox isn't running!"*)
    icon=""
    ;;
  *)
    icon=""
    ;;
esac

# Output JSON for Waybar
echo "{\"text\": \"$icon\", \"tooltip\": \"$status\", \"class\": \"dropbox\"}"

