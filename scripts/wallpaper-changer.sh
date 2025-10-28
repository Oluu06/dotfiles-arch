#!/bin/bash

#############################################
# Wallpaper Changer
# Change wallpaper and apply pywal colors
#############################################

set -e

WALLPAPER_DIR="${HOME}/.local/share/wallpapers"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

#############################################
# Functions
#############################################

list_wallpapers() {
    echo -e "${BLUE}Available wallpapers:${NC}"
    echo ""
    local i=1
    for wallpaper in "${WALLPAPER_DIR}"/*.{jpg,jpeg,png,JPG,JPEG,PNG} 2>/dev/null; do
        if [ -f "$wallpaper" ]; then
            echo -e "${GREEN}[$i]${NC} $(basename "$wallpaper")"
            ((i++))
        fi
    done
    echo ""
}

get_wallpaper_by_number() {
    local num=$1
    local i=1
    for wallpaper in "${WALLPAPER_DIR}"/*.{jpg,jpeg,png,JPG,JPEG,PNG} 2>/dev/null; do
        if [ -f "$wallpaper" ]; then
            if [ $i -eq $num ]; then
                echo "$wallpaper"
                return
            fi
            ((i++))
        fi
    done
}

apply_wallpaper() {
    local wallpaper_path=$1
    
    if [ ! -f "$wallpaper_path" ]; then
        echo -e "${RED}[ERROR]${NC} Wallpaper not found: ${wallpaper_path}"
        exit 1
    fi
    
    echo -e "${YELLOW}[WALLPAPER]${NC} Setting wallpaper..."
    feh --bg-fill "$wallpaper_path"
    
    # Generate pywal colors
    if command -v wal &> /dev/null; then
        echo -e "${YELLOW}[PYWAL]${NC} Generating color scheme..."
        wal -i "$wallpaper_path" -n -q
        
        # Reload applications that use pywal colors
        echo -e "${YELLOW}[RELOAD]${NC} Reloading applications..."
        
        # Reload polybar
        ~/.config/polybar/launch.sh &>/dev/null &
        
        # Restart dunst
        killall dunst 2>/dev/null || true
        dunst &>/dev/null &
        
        # Update betterlockscreen cache in background
        betterlockscreen -u "$wallpaper_path" &>/dev/null &
    fi
    
    echo -e "${GREEN}[SUCCESS]${NC} Wallpaper applied: $(basename "$wallpaper_path")"
    
    # Send notification
    notify-send "Wallpaper Changed" "$(basename "$wallpaper_path")" -i preferences-desktop-wallpaper
}

random_wallpaper() {
    local wallpapers=("${WALLPAPER_DIR}"/*.{jpg,jpeg,png,JPG,JPEG,PNG})
    local count=0
    local valid_wallpapers=()
    
    for wp in "${wallpapers[@]}"; do
        if [ -f "$wp" ]; then
            valid_wallpapers+=("$wp")
        fi
    done
    
    if [ ${#valid_wallpapers[@]} -eq 0 ]; then
        echo -e "${RED}[ERROR]${NC} No wallpapers found in ${WALLPAPER_DIR}"
        exit 1
    fi
    
    local random_index=$((RANDOM % ${#valid_wallpapers[@]}))
    apply_wallpaper "${valid_wallpapers[$random_index]}"
}

#############################################
# Main
#############################################

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo -e "${YELLOW}[INFO]${NC} Creating wallpaper directory: ${WALLPAPER_DIR}"
    mkdir -p "$WALLPAPER_DIR"
fi

# If wallpaper path provided as argument
if [ -n "$1" ]; then
    if [ "$1" = "random" ] || [ "$1" = "-r" ]; then
        random_wallpaper
    elif [ -f "$1" ]; then
        apply_wallpaper "$1"
    else
        echo -e "${RED}[ERROR]${NC} File not found: $1"
        exit 1
    fi
    exit 0
fi

# Check if there are any wallpapers
wallpaper_count=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) 2>/dev/null | wc -l)

if [ "$wallpaper_count" -eq 0 ]; then
    echo -e "${RED}[ERROR]${NC} No wallpapers found in ${WALLPAPER_DIR}"
    echo -e "${YELLOW}[INFO]${NC} Add some wallpapers to ${WALLPAPER_DIR}"
    exit 1
fi

# Interactive mode
clear
echo -e "${BLUE}"
echo "╔════════════════════════════════════════╗"
echo "║       WALLPAPER CHANGER                ║"
echo "╚════════════════════════════════════════╝"
echo -e "${NC}"

list_wallpapers

echo -e "${GREEN}[r]${NC} Random wallpaper"
echo -e "${RED}[q]${NC} Quit"
echo ""
echo -n "Select a wallpaper number: "
read -r choice

if [ "$choice" = "q" ] || [ "$choice" = "Q" ]; then
    echo -e "${BLUE}[EXIT]${NC} Cancelled by user"
    exit 0
fi

if [ "$choice" = "r" ] || [ "$choice" = "R" ]; then
    random_wallpaper
    exit 0
fi

# Validate input
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}[ERROR]${NC} Invalid input!"
    exit 1
fi

# Get wallpaper by number
wallpaper_path=$(get_wallpaper_by_number "$choice")

if [ -z "$wallpaper_path" ]; then
    echo -e "${RED}[ERROR]${NC} Invalid wallpaper number!"
    exit 1
fi

apply_wallpaper "$wallpaper_path"
