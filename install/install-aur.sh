#!/bin/bash

#############################################
# Install AUR Helper (paru)
#############################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}[AUR]${NC} Checking for AUR helper..."

# Check if paru is already installed
if command -v paru &> /dev/null; then
    echo -e "${GREEN}[✓]${NC} paru is already installed"
    exit 0
fi

# Check if yay is installed (alternative)
if command -v yay &> /dev/null; then
    echo -e "${GREEN}[✓]${NC} yay is already installed (alternative AUR helper)"
    exit 0
fi

echo -e "${YELLOW}[AUR]${NC} Installing paru..."

# Install dependencies
sudo pacman -S --needed --noconfirm base-devel git

# Clone paru repository
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

git clone https://aur.archlinux.org/paru.git
cd paru

# Build and install
makepkg -si --noconfirm

# Cleanup
cd ~
rm -rf "$TEMP_DIR"

echo -e "${GREEN}[SUCCESS]${NC} paru installed successfully"
