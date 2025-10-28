#!/bin/bash

#############################################
# Verify Installation
# Check if all components are properly installed
#############################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    Installation Verification Tool     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

ERRORS=0
WARNINGS=0

#############################################
# Check Functions
#############################################

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}[✓]${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}[✗]${NC} $1 is NOT installed"
        ((ERRORS++))
        return 1
    fi
}

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}[✓]${NC} $1 exists"
        return 0
    else
        echo -e "${RED}[✗]${NC} $1 is missing"
        ((ERRORS++))
        return 1
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}[✓]${NC} $1 exists"
        return 0
    else
        echo -e "${YELLOW}[!]${NC} $1 is missing"
        ((WARNINGS++))
        return 1
    fi
}

check_process() {
    if pgrep -x "$1" > /dev/null; then
        echo -e "${GREEN}[✓]${NC} $1 is running"
        return 0
    else
        echo -e "${YELLOW}[!]${NC} $1 is NOT running"
        ((WARNINGS++))
        return 1
    fi
}

#############################################
# Checks
#############################################

echo -e "${BLUE}[CHECK]${NC} Core packages..."
check_command bspwm
check_command sxhkd
check_command polybar
check_command picom
check_command kitty
check_command rofi
check_command dunst
check_command feh
check_command wal
check_command paru

echo ""
echo -e "${BLUE}[CHECK]${NC} Configuration files..."
check_file ~/.config/bspwm/bspwmrc
check_file ~/.config/sxhkd/sxhkdrc
check_file ~/.config/polybar/config.ini
check_file ~/.config/picom/picom.conf
check_file ~/.config/kitty/kitty.conf
check_file ~/.config/rofi/config.rasi
check_file ~/.config/dunst/dunstrc
check_file ~/.zshrc
check_file ~/.xinitrc

echo ""
echo -e "${BLUE}[CHECK]${NC} Directories..."
check_dir ~/.config/themes
check_dir ~/.local/bin
check_dir ~/.local/share/wallpapers

echo ""
echo -e "${BLUE}[CHECK]${NC} Scripts..."
check_file ~/.local/bin/theme-switcher.sh
check_file ~/.local/bin/wallpaper-changer.sh
check_file ~/.local/bin/powermenu.sh
check_file ~/.local/bin/screenshot.sh

echo ""
echo -e "${BLUE}[CHECK]${NC} Running processes (if bspwm is active)..."
if pgrep -x bspwm > /dev/null; then
    check_process bspwm
    check_process sxhkd
    check_process polybar
    check_process picom
    check_process dunst
else
    echo -e "${YELLOW}[!]${NC} bspwm is not running (not logged in?)"
fi

echo ""
echo -e "${BLUE}[CHECK]${NC} Fonts..."
if fc-list | grep -i "JetBrainsMono Nerd Font" > /dev/null; then
    echo -e "${GREEN}[✓]${NC} JetBrainsMono Nerd Font is installed"
else
    echo -e "${RED}[✗]${NC} JetBrainsMono Nerd Font is NOT installed"
    ((ERRORS++))
fi

#############################################
# Summary
#############################################

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║           Verification Summary         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}[SUCCESS]${NC} Everything looks good! ✨"
    echo ""
    echo "You can now:"
    echo "  1. Logout from your current session"
    echo "  2. Select 'bspwm' from your display manager"
    echo "  3. Login and enjoy!"
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}[WARNING]${NC} Installation complete with $WARNINGS warnings"
    echo "Some optional components are missing, but the system should work."
else
    echo -e "${RED}[ERROR]${NC} Found $ERRORS errors and $WARNINGS warnings"
    echo "Please run the installer again or check the documentation."
fi

echo ""
exit $ERRORS
