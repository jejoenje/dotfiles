#!/bin/bash

### Pick random wallpeper from folder
wpfile=$(find ~/wallpaper/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)


### Reset swww, and set to randomly picked file
#swww kill
#swww init
swww img $wpfile &

### Generate colour scheme
# wal -q -l --contrast 10 --saturate 0.5 -i $wpfile &  # Light
# wal -q --contrast 10 --saturate 0.5 -i $wpfile &       # Dark
wal -q --contrast 20 --saturate 0.5 -i $wpfile &       # Dark

### Update mako colours
~/.config/mako/update-mako-colors.sh

