#!/bin/bash

# Pick random wallpeper from folder
wpfile=$(find ~/wallpaper/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)


# Reset swww, and set to randomly picked file
#swww kill
#swww init
swww img $wpfile &

# Generate colour scheme
wal -q --contrast 5 -i $wpfile &


