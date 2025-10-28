#!/bin/bash

#############################################
# Install Themes
#############################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
THEMES_DIR="${PROJECT_ROOT}/themes"

echo -e "${BLUE}[THEMES]${NC} Installing themes..."

#############################################
# Copy themes
#############################################

echo -e "${YELLOW}[COPY]${NC} Copying theme files..."

# Create themes directory
mkdir -p "${HOME}/.config/themes"

# Copy all themes
cp -r "${THEMES_DIR}/"* "${HOME}/.config/themes/"

echo -e "${GREEN}[✓]${NC} Themes copied to ~/.config/themes"

#############################################
# Apply default theme (Catppuccin Mocha)
#############################################

echo -e "${YELLOW}[THEME]${NC} Applying default theme (Catppuccin Mocha)..."

# Create symlink to current theme
ln -sf "${HOME}/.config/themes/catppuccin-mocha" "${HOME}/.config/themes/current"

echo -e "${GREEN}[✓]${NC} Default theme applied"

#############################################
# Download sample wallpapers
#############################################

echo -e "${YELLOW}[WALLPAPERS]${NC} Setting up wallpapers..."

WALLPAPER_DIR="${HOME}/.local/share/wallpapers"
mkdir -p "$WALLPAPER_DIR"

# Copy wallpapers from themes
if [ -d "${THEMES_DIR}/catppuccin-mocha/wallpapers" ]; then
    cp "${THEMES_DIR}/catppuccin-mocha/wallpapers/"* "$WALLPAPER_DIR/" 2>/dev/null || true
fi

# Set default wallpaper if exists
if [ -f "${WALLPAPER_DIR}/default.jpg" ]; then
    echo -e "${GREEN}[✓]${NC} Default wallpaper set"
else
    echo -e "${YELLOW}[!]${NC} No default wallpaper found"
    echo -e "${YELLOW}[!]${NC} Add your wallpapers to: ${WALLPAPER_DIR}"
fi

echo -e "${GREEN}[SUCCESS]${NC} Themes installed successfully!"
echo -e "${BLUE}[INFO]${NC} Use 'theme-switcher' command to change themes"
