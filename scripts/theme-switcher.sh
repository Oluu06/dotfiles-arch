#!/bin/bash

#############################################
# Theme Switcher
# Switch between different color themes
#############################################

set -e

THEMES_DIR="${HOME}/.config/themes"
CURRENT_THEME_LINK="${THEMES_DIR}/current"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m'

#############################################
# Functions
#############################################

list_themes() {
    echo -e "${BLUE}Available themes:${NC}"
    echo ""
    local i=1
    for theme in "${THEMES_DIR}"/*; do
        if [ -d "$theme" ] && [ "$(basename "$theme")" != "current" ]; then
            local theme_name=$(basename "$theme")
            if [ -L "$CURRENT_THEME_LINK" ] && [ "$(readlink -f "$CURRENT_THEME_LINK")" = "$(readlink -f "$theme")" ]; then
                echo -e "${GREEN}[$i]${NC} $theme_name ${YELLOW}(current)${NC}"
            else
                echo -e "${GREEN}[$i]${NC} $theme_name"
            fi
            ((i++))
        fi
    done
    echo ""
}

get_theme_by_number() {
    local num=$1
    local i=1
    for theme in "${THEMES_DIR}"/*; do
        if [ -d "$theme" ] && [ "$(basename "$theme")" != "current" ]; then
            if [ $i -eq $num ]; then
                echo "$(basename "$theme")"
                return
            fi
            ((i++))
        fi
    done
}

apply_theme() {
    local theme_name=$1
    local theme_path="${THEMES_DIR}/${theme_name}"
    
    if [ ! -d "$theme_path" ]; then
        echo -e "${RED}[ERROR]${NC} Theme '${theme_name}' not found!"
        exit 1
    fi
    
    echo -e "${YELLOW}[THEME]${NC} Applying theme: ${theme_name}"
    
    # Update current theme symlink
    rm -f "$CURRENT_THEME_LINK"
    ln -sf "$theme_path" "$CURRENT_THEME_LINK"
    
    # Source theme colors
    if [ -f "${theme_path}/colors.sh" ]; then
        source "${theme_path}/colors.sh"
    fi
    
    # Apply wallpaper if exists
    if [ -f "${theme_path}/wallpapers/default.jpg" ]; then
        echo -e "${YELLOW}[WALLPAPER]${NC} Setting wallpaper..."
        feh --bg-fill "${theme_path}/wallpapers/default.jpg"
        
        # Generate pywal colors
        if command -v wal &> /dev/null; then
            wal -i "${theme_path}/wallpapers/default.jpg" -n -q
        fi
    fi
    
    # Reload bspwm
    echo -e "${YELLOW}[BSPWM]${NC} Reloading bspwm..."
    ~/.config/bspwm/bspwmrc &
    
    # Reload polybar
    echo -e "${YELLOW}[POLYBAR]${NC} Reloading polybar..."
    ~/.config/polybar/launch.sh &
    
    # Restart dunst
    echo -e "${YELLOW}[DUNST]${NC} Restarting dunst..."
    killall dunst 2>/dev/null || true
    dunst &
    
    # Reload picom
    echo -e "${YELLOW}[PICOM]${NC} Reloading picom..."
    killall picom 2>/dev/null || true
    picom --config ~/.config/picom/picom.conf &
    
    echo -e "${GREEN}[SUCCESS]${NC} Theme '${theme_name}' applied successfully!"
    
    # Send notification
    notify-send "Theme Switcher" "Theme '${theme_name}' applied successfully!" -i preferences-desktop-theme
}

#############################################
# Main
#############################################

# Check if themes directory exists
if [ ! -d "$THEMES_DIR" ]; then
    echo -e "${RED}[ERROR]${NC} Themes directory not found: ${THEMES_DIR}"
    exit 1
fi

# If theme name provided as argument
if [ -n "$1" ]; then
    apply_theme "$1"
    exit 0
fi

# Interactive mode
clear
echo -e "${MAGENTA}"
echo "╔════════════════════════════════════════╗"
echo "║          THEME SWITCHER                ║"
echo "╚════════════════════════════════════════╝"
echo -e "${NC}"

list_themes

echo -n "Select a theme number (or 'q' to quit): "
read -r choice

if [ "$choice" = "q" ] || [ "$choice" = "Q" ]; then
    echo -e "${BLUE}[EXIT]${NC} Cancelled by user"
    exit 0
fi

# Validate input
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}[ERROR]${NC} Invalid input!"
    exit 1
fi

# Get theme name by number
theme_name=$(get_theme_by_number "$choice")

if [ -z "$theme_name" ]; then
    echo -e "${RED}[ERROR]${NC} Invalid theme number!"
    exit 1
fi

apply_theme "$theme_name"
