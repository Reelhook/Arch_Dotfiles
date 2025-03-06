#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo "$0 requires a path"
  exit 1
fi

# List all symbolic links in the specified directory and its subdirectories
find "$1" -type l -ls | awk '{print $11}'

