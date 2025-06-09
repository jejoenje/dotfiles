#!/bin/bash

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <image_filename>"
  exit 1
fi

# Define the base wallpaper directory
WALLPAPER_DIR=~/wallpaper

# Combine the directory and the filename
IMAGE_PATH="$WALLPAPER_DIR/$1"

# Check if the file exists
if [ ! -f "$IMAGE_PATH" ]; then
  echo "Error: File '$IMAGE_PATH' does not exist."
  exit 1
fi

# Run the commands with the specified image
swww img "$IMAGE_PATH" && wal -i "$IMAGE_PATH"
