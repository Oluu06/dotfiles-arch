#!/bin/bash

#############################################
# Check for system updates
#############################################

# Check if paru or yay is installed
if command -v paru &> /dev/null; then
    AUR_HELPER="paru"
elif command -v yay &> /dev/null; then
    AUR_HELPER="yay"
else
    echo "0"
    exit 0
fi

# Get number of updates
UPDATES=$($AUR_HELPER -Qu 2>/dev/null | wc -l)

if [ "$UPDATES" -eq 0 ]; then
    echo "0"
else
    echo "$UPDATES"
fi
