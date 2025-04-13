#!/bin/bash

# Check if a command argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

# Fetch the cheat sheet for the provided command
curl cheat.sh/$1