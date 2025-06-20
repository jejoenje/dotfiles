#!/bin/bash

### Scan wifi
mapfile -t ssids < <(nmcli -t -f SSID device wifi list | awk 'NF' | sort -u)

### Choose via rofi
chosen_ssid=$(printf '%s\n' "${ssids[@]}" | rofi -dmenu -p "Select WiFi")

### Exit if nothing selected
[ -z "chosen_ssid" ] && exit

### Check if network is already known
if nmcli connection show | grep -q "$chosen_ssid"; then
	nmcli connection up "$chosen_ssid"
	notify-send "Wifi" "Connected to $chosen_ssid"
else
	# Ask for password
	password=$(rofi -dmenu -password -p "Enter password for $chosen_ssid")
	[-z "$password" ] && exit
	nmcli device wifi connect "$chosen_ssid" password "$password" && \
		notify-send "Wifi" "Connected to $chosen_ssid"
fi
