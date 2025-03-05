#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
else
  echo "Command didn't recieve a path RERE" 
fi

# List all symbolic links in the specified directory and its subdirectories
find "$1" -type l -ls | awk '{print $11}'

