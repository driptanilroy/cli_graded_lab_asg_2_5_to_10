#!/bin/bash

# Check for the exactly one argument
if [ $# -ne 1 ]; then
    echo "Error: Provide exactly one argument."
    exit 1
fi

# Check if the path exists
if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If the argument is a file
if [ -f "$1" ]; then
    echo "File Analysis:"
    echo "Lines: $(wc -l < "$1")"
    echo "Words: $(wc -w < "$1")"
    echo "Characters: $(wc -c < "$1")"

# If the argument is a directory
elif [ -d "$1" ]; then
    echo "Directory Analysis:"
    echo "Total files: $(ls -l "$1" | grep "^-" | wc -l)"
    echo ".txt files: $(ls "$1"/*.txt 2>/dev/null | wc -l)"
else
    echo "Error: Invalid input."
fi
