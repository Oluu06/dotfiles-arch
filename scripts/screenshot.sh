#!/bin/bash

#############################################
# Screenshot Script
# Take screenshots with flameshot
#############################################

SCREENSHOT_DIR="${HOME}/Pictures/Screenshots"

# Create screenshot directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

case "$1" in
    full)
        # Full screen screenshot
        flameshot full -p "$SCREENSHOT_DIR"
        notify-send "Screenshot" "Full screen captured" -i camera-photo
        ;;
    window)
        # Current window screenshot
        flameshot screen -p "$SCREENSHOT_DIR"
        notify-send "Screenshot" "Window captured" -i camera-photo
        ;;
    region|*)
        # Region selection (default)
        flameshot gui -p "$SCREENSHOT_DIR"
        ;;
esac
