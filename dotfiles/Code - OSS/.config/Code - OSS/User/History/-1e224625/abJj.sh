#!/bin/bash

# Check if the user provided a directory as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

# Input directory
input_dir="$1"

# Define the destination path
path1="/your/path1"
path2="/your/path2"
destination="$path1/sub-directories$path2"

# Ensure the destination exists
mkdir -p "$destination"

# Move the subdirectories
for subdir in "$input_dir"/*/; do
    if [ -d "$subdir" ]; then
        # mv "$subdir" "$destination"
        echo "Moved $(basename "$subdir") to $destination"
    fi
done

echo "All subdirectories have been moved."
