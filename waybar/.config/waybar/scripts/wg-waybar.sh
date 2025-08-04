#!/bin/bash

# Check if the WireGuard interface is active by seeing if wg reports it
if sudo wg show jellyholm 2>/dev/null | grep -q 'interface'; then
  # Active icon + tooltip
  echo '{"text":"","tooltip":"WireGuard: active","class":"active"}'
else
  # Inactive icon + tooltip
  echo '{"text":"","tooltip":"WireGuard: inactive","class":"inactive"}'
fi
