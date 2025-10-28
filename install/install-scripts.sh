#!/bin/bash

#############################################
# Install Scripts and Utilities
#############################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SCRIPTS_DIR="${PROJECT_ROOT}/scripts"

echo -e "${BLUE}[SCRIPTS]${NC} Installing scripts and utilities..."

#############################################
# Create bin directory
#############################################

BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"

#############################################
# Copy scripts
#############################################

echo -e "${YELLOW}[COPY]${NC} Copying scripts to ~/.local/bin..."

# Copy all scripts
cp "${SCRIPTS_DIR}/"*.sh "$BIN_DIR/"

# Make scripts executable
chmod +x "$BIN_DIR/"*.sh

# Create symlinks without .sh extension for convenience
cd "$BIN_DIR"
for script in *.sh; do
    name="${script%.sh}"
    ln -sf "$script" "$name"
    echo -e "${GREEN}[✓]${NC} Installed: $name"
done

#############################################
# Add to PATH if not already
#############################################

echo -e "${YELLOW}[PATH]${NC} Checking PATH configuration..."

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo -e "${YELLOW}[!]${NC} Adding ~/.local/bin to PATH in .zshrc"
    echo "" >> "${HOME}/.zshrc"
    echo "# Add local bin to PATH" >> "${HOME}/.zshrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${HOME}/.zshrc"
    echo -e "${GREEN}[✓]${NC} PATH updated"
else
    echo -e "${GREEN}[✓]${NC} ~/.local/bin already in PATH"
fi

echo -e "${GREEN}[SUCCESS]${NC} Scripts installed successfully!"
echo -e "${BLUE}[INFO]${NC} Available commands:"
echo -e "  - ${GREEN}screenshot${NC}        Take screenshots"
echo -e "  - ${GREEN}wallpaper-changer${NC}  Change wallpaper with pywal"
echo -e "  - ${GREEN}powermenu${NC}          Power menu (logout/reboot/shutdown)"
echo -e "  - ${GREEN}theme-switcher${NC}     Switch between themes"
echo -e "  - ${GREEN}audio-control${NC}      Control audio volume"
echo -e "  - ${GREEN}brightness-control${NC} Control screen brightness"
