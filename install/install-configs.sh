#!/bin/bash

#############################################
# Install Configuration Files
#############################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="${PROJECT_ROOT}/config"

echo -e "${BLUE}[CONFIG]${NC} Installing configuration files..."

#############################################
# Create necessary directories
#############################################

echo -e "${YELLOW}[DIRS]${NC} Creating configuration directories..."

DIRS=(
    "${HOME}/.config/bspwm"
    "${HOME}/.config/sxhkd"
    "${HOME}/.config/polybar"
    "${HOME}/.config/picom"
    "${HOME}/.config/kitty"
    "${HOME}/.config/rofi"
    "${HOME}/.config/dunst"
    "${HOME}/.config/ranger"
    "${HOME}/.config/btop"
    "${HOME}/.local/bin"
    "${HOME}/.local/share/wallpapers"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    echo -e "${GREEN}[✓]${NC} Created: $dir"
done

#############################################
# Copy configuration files
#############################################

echo -e "${YELLOW}[COPY]${NC} Copying configuration files..."

# bspwm
cp -r "${CONFIG_DIR}/bspwm/"* "${HOME}/.config/bspwm/"
chmod +x "${HOME}/.config/bspwm/bspwmrc"
echo -e "${GREEN}[✓]${NC} bspwm config installed"

# sxhkd
cp -r "${CONFIG_DIR}/sxhkd/"* "${HOME}/.config/sxhkd/"
echo -e "${GREEN}[✓]${NC} sxhkd config installed"

# polybar
cp -r "${CONFIG_DIR}/polybar/"* "${HOME}/.config/polybar/"
chmod +x "${HOME}/.config/polybar/launch.sh"
chmod +x "${HOME}/.config/polybar/scripts/"*.sh 2>/dev/null || true
echo -e "${GREEN}[✓]${NC} polybar config installed"

# picom
cp -r "${CONFIG_DIR}/picom/"* "${HOME}/.config/picom/"
echo -e "${GREEN}[✓]${NC} picom config installed"

# kitty
cp -r "${CONFIG_DIR}/kitty/"* "${HOME}/.config/kitty/"
echo -e "${GREEN}[✓]${NC} kitty config installed"

# rofi
cp -r "${CONFIG_DIR}/rofi/"* "${HOME}/.config/rofi/"
echo -e "${GREEN}[✓]${NC} rofi config installed"

# dunst
cp -r "${CONFIG_DIR}/dunst/"* "${HOME}/.config/dunst/"
echo -e "${GREEN}[✓]${NC} dunst config installed"

# ranger
cp -r "${CONFIG_DIR}/ranger/"* "${HOME}/.config/ranger/"
echo -e "${GREEN}[✓]${NC} ranger config installed"

# btop
cp -r "${CONFIG_DIR}/btop/"* "${HOME}/.config/btop/"
echo -e "${GREEN}[✓]${NC} btop config installed"

# zsh
cp "${CONFIG_DIR}/zsh/.zshrc" "${HOME}/.zshrc"
cp "${CONFIG_DIR}/zsh/.p10k.zsh" "${HOME}/.p10k.zsh"
echo -e "${GREEN}[✓]${NC} zsh config installed"

# X11
cp "${CONFIG_DIR}/X11/.xinitrc" "${HOME}/.xinitrc"
cp "${CONFIG_DIR}/X11/.Xresources" "${HOME}/.Xresources"
echo -e "${GREEN}[✓]${NC} X11 config installed"

#############################################
# Set default shell to zsh
#############################################

if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${YELLOW}[SHELL]${NC} Changing default shell to zsh..."
    chsh -s "$(which zsh)"
    echo -e "${GREEN}[✓]${NC} Default shell changed to zsh"
else
    echo -e "${GREEN}[✓]${NC} zsh is already the default shell"
fi

#############################################
# Generate betterlockscreen cache
#############################################

echo -e "${YELLOW}[LOCK]${NC} Setting up betterlockscreen..."
if [ -f "${HOME}/.local/share/wallpapers/default.jpg" ]; then
    betterlockscreen -u "${HOME}/.local/share/wallpapers/default.jpg" &
    echo -e "${GREEN}[✓]${NC} betterlockscreen cache generation started in background"
else
    echo -e "${YELLOW}[!]${NC} No default wallpaper found, skipping betterlockscreen setup"
fi

echo -e "${GREEN}[SUCCESS]${NC} Configuration files installed successfully!"
