#!/bin/bash

# Define options for opacity levels
options="1.0\n0.95\n0.9\n0.85\n0.8\n0.75\n0.7\n0.65\n0.6"

# Use rofi to select an opacity level
selected=$(echo -e "$options" | rofi -dmenu -p "Alacritty Opacity")

# Exit if nothing was selected
[[ -z "$selected" ]] && exit 1

# Path to your Alacritty config file
config_file="$HOME/.config/alacritty/alacritty.toml"

# Use sed to update background_opacity
sed -i -E "s/^( *opacity = ).*/\1$selected/" "$config_file"

notify-send "Alacritty opacity set to $selected"
