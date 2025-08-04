#!/bin/bash

VPN="flerelnet"
SERVICE="openvpn-client@${VPN}.service"

STATUS=$(systemctl is-active "$SERVICE")

CHOICE=$(echo -e "VPN: $STATUS\nStart\nStop" | rofi -dmenu -p "OpenVPN Control")

case "$CHOICE" in
  Start)
    sudo systemctl start "$SERVICE"
    ;;
  Stop)
    sudo systemctl stop "$SERVICE"
    ;;
esac

