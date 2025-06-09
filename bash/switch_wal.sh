#!/bin/bash

# Define the base wallpaper directory
WALLPAPER_DIR=~/wallpaper

# If no argument is provided, pick a random image from the directory
if [ -z "$1" ]; then
  # Get all regular files in the wallpaper directory
  FILES=("$WALLPAPER_DIR"/*)
  
  # Check if there are any files
  if [ ${#FILES[@]} -eq 0 ]; then
    echo "Error: No files found in $WALLPAPER_DIR"
    exit 1
  fi

  # Pick a random file
  RANDOM_INDEX=$((RANDOM % ${#FILES[@]}))
  IMAGE_PATH="${FILES[$RANDOM_INDEX]}"
else
  # Combine the directory and the filename
  IMAGE_PATH="$WALLPAPER_DIR/$1"

  # Check if the specified file exists
  if [ ! -f "$IMAGE_PATH" ]; then
    echo "Error: File '$IMAGE_PATH' does not exist."
    exit 1
  fi
fi

# Run the commands with the selected image
swww img "$IMAGE_PATH" && wal -i "$IMAGE_PATH"
