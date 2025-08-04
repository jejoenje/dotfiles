#!/bin/bash

OPENVPN="flerelnet"
WIREGUARD="jellyholm"
OPENVPN_SERVICE="openvpn-client@${OPENVPN}.service"

CHOICE=$(echo -e "Start OpenVPN\nStop OpenVPN\nStart WireGuard\nStop WireGuard" | rofi -dmenu -p "VPN Control")

case "$CHOICE" in
  "Start OpenVPN")
    notify-send "VPN" "Starting OpenVPN..."
    sudo systemctl start "$OPENVPN_SERVICE"
    ;;
  "Stop OpenVPN")
    notify-send "VPN" "Stopping OpenVPN..."
    sudo systemctl stop "$OPENVPN_SERVICE"
    ;;
  "Start WireGuard")
    notify-send "VPN" "Starting WireGuard..."
    sudo wg-quick up "$WIREGUARD"
    ;;
  "Stop WireGuard")
    notify-send "VPN" "Stopping WireGuard..."
    sudo wg-quick down "$WIREGUARD"
    ;;
esac

