#!/bin/bash

# Check if the user provided enough arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign arguments to variables
SOURCE_DIR=$1
DEST_DIR=$2

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Ensure the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory '$DEST_DIR' does not exist. Creating it..."
    mkdir -p "$DEST_DIR"
fi

# Iterate over each subdirectory in the source directory
for SUB_DIR in "$SOURCE_DIR"/*/; do
    if [ -d "$SUB_DIR" ]; then
        # Extract the subdirectory name
        SUB_DIR_NAME=$(basename "$SUB_DIR")
        
        # Define the target path
        TARGET_PATH="$DEST_DIR/$SUB_DIR_NAME/.config/$SUB_DIR_NAME"
        
        # Create the target directory
        mkdir -p "$TARGET_PATH"
        
        # Copy the contents of the subdirectory
        echo "Copying '$SUB_DIR' to '$TARGET_PATH'..."
        cp -r "$SUB_DIR"/* "$TARGET_PATH"
    fi
done

# Confirm completion
echo "All subdirectories from '$SOURCE_DIR' have been copied to '$DEST_DIR' in the desired format."
