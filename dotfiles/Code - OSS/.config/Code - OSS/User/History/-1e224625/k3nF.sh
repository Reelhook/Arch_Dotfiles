#!/bin/bash

# Check if the user provided a destination path as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <destination_path>"
    exit 1
fi

# Assign the destination argument to a variable
DESTINATION=$1

# Define the target directory inside the destination for stow
TARGET_DIR="$DESTINATION/.config"

# Ensure the destination directory exists
if [ ! -d "$DESTINATION" ]; then
    echo "The destination directory '$DESTINATION' does not exist. Creating it..."
    mkdir -p "$DESTINATION"
fi

# Ensure the target directory for stow exists
if [ -d "$TARGET_DIR" ]; then
    echo "The target directory '$TARGET_DIR' already exists. Removing it to avoid duplication..."
    rm -rf "$TARGET_DIR"
fi

# Copy the ~/.config directory into the target directory
echo "Copying ~/.config to $TARGET_DIR for GNU Stow..."
mkdir -p "$TARGET_DIR" && cp -r ~/.config/* "$TARGET_DIR"

# Confirm completion
echo "Configuration files copied to $TARGET_DIR successfully."
echo "You can now use GNU Stow to manage these files."
