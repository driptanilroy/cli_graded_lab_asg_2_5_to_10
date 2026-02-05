#!/bin/bash

# Check argument count
if [ $# -ne 1 ]
then
    echo "Error: Provide exactly one log file."
    exit 1
fi

# Check if file exists and is readable
if [ ! -r "$1" ]
then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

# Counting log entries
total=$(wc -l < "$1")
info=$(grep " INFO " "$1" | wc -l)
warning=$(grep " WARNING " "$1" | wc -l)
error=$(grep " ERROR " "$1" | wc -l)

# Most recent ERROR
last_error=$(grep " ERROR " "$1" | tail -1)

# Report file name
date=$(date +%Y-%m-%d)
report="logsummary_$date.txt"

# Writing report
echo "Log Summary Report - $date" > "$report"
echo "Total entries: $total" >> "$report"
echo "INFO messages: $info" >> "$report"
echo "WARNING messages: $warning" >> "$report"
echo "ERROR messages: $error" >> "$report"
echo "Most recent ERROR:" >> "$report"
echo "$last_error" >> "$report"

# Display output
cat "$report"
