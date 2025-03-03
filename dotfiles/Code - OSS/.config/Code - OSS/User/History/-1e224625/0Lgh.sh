#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Input arguments
source_dir="$1"
destination_dir="$2"

# Ensure the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory does not exist!"
    exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Copy each subdirectory in STOW format
for subdir in "$source_dir"/*/; do
    if [ -d "$subdir" ]; then
        subdir_name=$(basename "$subdir")

        # Create a STOW-like format directory in the destination
        stow_path="$destination_dir/$subdir_name"
        mkdir -p "$stow_path"

        # Copy the contents of the subdirectory into the STOW directory
        cp -r "$subdir"* "$stow_path"
        echo "Copied contents of $subdir_name to $stow_path"
    fi
done

echo "Subdirectories have been copied in STOW-like format to $destination_dir."
