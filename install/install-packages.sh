#!/bin/bash

#############################################
# Install All Required Packages
#############################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[PACKAGES]${NC} Installing required packages..."

# Check for AUR helper
if ! command -v paru &> /dev/null && ! command -v yay &> /dev/null; then
    echo -e "${RED}[ERROR]${NC} No AUR helper found. Please install paru or yay first."
    exit 1
fi

AUR_HELPER=$(command -v paru || command -v yay)

#############################################
# Package Lists
#############################################

# Core system packages
CORE_PACKAGES=(
    "xorg-server"
    "xorg-xinit"
    "xorg-xrandr"
    "xorg-xsetroot"
    "xorg-xprop"
)

# Window Manager & Compositor
WM_PACKAGES=(
    "bspwm"
    "sxhkd"
)

# Compositor (AUR)
COMPOSITOR_AUR=(
    "picom-pijulius-git"
)

# Bar & Notifications
BAR_PACKAGES=(
    "polybar"
    "dunst"
)

# Terminal & Shell
TERMINAL_PACKAGES=(
    "kitty"
    "zsh"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

# Launcher & Tools
LAUNCHER_PACKAGES=(
    "rofi"
    "feh"
    "pywal"
    "betterlockscreen"
)

# File Managers
FM_PACKAGES=(
    "thunar"
    "thunar-volman"
    "thunar-archive-plugin"
    "gvfs"
    "ranger"
)

# System Monitoring & Utils
UTILS_PACKAGES=(
    "btop"
    "flameshot"
    "brightnessctl"
    "pamixer"
    "pulseaudio"
    "pulseaudio-alsa"
    "pavucontrol"
    "networkmanager"
    "network-manager-applet"
    "bluez"
    "bluez-utils"
    "blueman"
)

# Fonts & Icons
FONTS_PACKAGES=(
    "ttf-jetbrains-mono-nerd"
    "ttf-font-awesome"
    "noto-fonts"
    "noto-fonts-emoji"
    "papirus-icon-theme"
)

# Additional tools
EXTRA_PACKAGES=(
    "xclip"
    "maim"
    "imagemagick"
    "jq"
    "wget"
    "curl"
    "unzip"
    "zip"
    "htop"
    "neofetch"
)

#############################################
# Installation Functions
#############################################

install_official_packages() {
    local packages=("$@")
    echo -e "${YELLOW}[PACMAN]${NC} Installing official packages..."
    
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &> /dev/null; then
            echo -e "${GREEN}[✓]${NC} $package already installed"
        else
            echo -e "${YELLOW}[→]${NC} Installing $package..."
            sudo pacman -S --needed --noconfirm "$package"
        fi
    done
}

install_aur_packages() {
    local packages=("$@")
    echo -e "${YELLOW}[AUR]${NC} Installing AUR packages..."
    
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &> /dev/null; then
            echo -e "${GREEN}[✓]${NC} $package already installed"
        else
            echo -e "${YELLOW}[→]${NC} Installing $package..."
            $AUR_HELPER -S --needed --noconfirm "$package"
        fi
    done
}

#############################################
# Main Installation
#############################################

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Installing System Packages        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

# Update system first
echo -e "${YELLOW}[UPDATE]${NC} Updating system..."
sudo pacman -Syu --noconfirm

# Install all official packages
ALL_OFFICIAL=(
    "${CORE_PACKAGES[@]}"
    "${WM_PACKAGES[@]}"
    "${BAR_PACKAGES[@]}"
    "${TERMINAL_PACKAGES[@]}"
    "${LAUNCHER_PACKAGES[@]}"
    "${FM_PACKAGES[@]}"
    "${UTILS_PACKAGES[@]}"
    "${FONTS_PACKAGES[@]}"
    "${EXTRA_PACKAGES[@]}"
)

install_official_packages "${ALL_OFFICIAL[@]}"

# Install AUR packages
ALL_AUR=(
    "${COMPOSITOR_AUR[@]}"
)

install_aur_packages "${ALL_AUR[@]}"

# Install Powerlevel10k
echo -e "${YELLOW}[ZSH]${NC} Installing Powerlevel10k..."
if [ ! -d "${HOME}/.powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.powerlevel10k"
    echo -e "${GREEN}[✓]${NC} Powerlevel10k installed"
else
    echo -e "${GREEN}[✓]${NC} Powerlevel10k already installed"
fi

# Enable NetworkManager
echo -e "${YELLOW}[SERVICE]${NC} Enabling NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager || true

# Enable Bluetooth
echo -e "${YELLOW}[SERVICE]${NC} Enabling Bluetooth..."
sudo systemctl enable bluetooth
sudo systemctl start bluetooth || true

echo -e "${GREEN}[SUCCESS]${NC} All packages installed successfully!"
