#!/bin/bash

#############################################
# Arch Linux Dotfiles - Master Installer
# Modern, Fluid, Minimal Setup
#############################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${SCRIPT_DIR}/config"
SCRIPTS_DIR="${SCRIPT_DIR}/scripts"
THEMES_DIR="${SCRIPT_DIR}/themes"
INSTALL_SCRIPTS_DIR="${SCRIPT_DIR}/install"
LOG_FILE="${SCRIPT_DIR}/install.log"
BACKUP_DIR="${HOME}/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# Trap errors
trap 'error_handler $? $LINENO' ERR

#############################################
# Functions
#############################################

error_handler() {
    echo -e "${RED}[ERROR]${NC} Installation failed at line $2 with exit code $1" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}[INFO]${NC} Check ${LOG_FILE} for details" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}[INFO]${NC} Your original configs are backed up in: ${BACKUP_DIR}" | tee -a "$LOG_FILE"
    exit 1
}

log() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

print_header() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║                                                            ║"
    echo "║           🚀 ARCH LINUX DOTFILES INSTALLER 🚀             ║"
    echo "║                                                            ║"
    echo "║              Fluid • Minimal • Modern                      ║"
    echo "║                                                            ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_menu() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}[1]${NC} Complete Installation (Recommended)"
    echo -e "${GREEN}[2]${NC} Install AUR Helper (paru)"
    echo -e "${GREEN}[3]${NC} Install Packages Only"
    echo -e "${GREEN}[4]${NC} Install Configurations Only"
    echo -e "${GREEN}[5]${NC} Install Themes"
    echo -e "${GREEN}[6]${NC} Install Scripts & Utilities"
    echo -e "${GREEN}[7]${NC} Backup Current Configs"
    echo -e "${RED}[0]${NC} Exit"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -n "Select an option: "
}

backup_configs() {
    log "${YELLOW}[BACKUP]${NC} Creating backup of existing configurations..."
    
    mkdir -p "$BACKUP_DIR"
    
    # List of config directories to backup
    local configs=(
        ".config/bspwm"
        ".config/sxhkd"
        ".config/polybar"
        ".config/picom"
        ".config/kitty"
        ".config/rofi"
        ".config/dunst"
        ".config/ranger"
        ".config/btop"
        ".zshrc"
        ".p10k.zsh"
        ".xinitrc"
        ".Xresources"
    )
    
    for config in "${configs[@]}"; do
        if [ -e "${HOME}/${config}" ]; then
            cp -r "${HOME}/${config}" "${BACKUP_DIR}/" 2>/dev/null || true
            log "${GREEN}[✓]${NC} Backed up: ${config}"
        fi
    done
    
    log "${GREEN}[SUCCESS]${NC} Backup completed: ${BACKUP_DIR}"
}

install_aur_helper() {
    log "${YELLOW}[INSTALL]${NC} Installing AUR helper (paru)..."
    bash "${INSTALL_SCRIPTS_DIR}/install-aur.sh" 2>&1 | tee -a "$LOG_FILE"
    log "${GREEN}[SUCCESS]${NC} AUR helper installed"
}

install_packages() {
    log "${YELLOW}[INSTALL]${NC} Installing packages..."
    bash "${INSTALL_SCRIPTS_DIR}/install-packages.sh" 2>&1 | tee -a "$LOG_FILE"
    log "${GREEN}[SUCCESS]${NC} Packages installed"
}

install_configs() {
    log "${YELLOW}[INSTALL]${NC} Installing configurations..."
    bash "${INSTALL_SCRIPTS_DIR}/install-configs.sh" 2>&1 | tee -a "$LOG_FILE"
    log "${GREEN}[SUCCESS]${NC} Configurations installed"
}

install_themes() {
    log "${YELLOW}[INSTALL]${NC} Installing themes..."
    bash "${INSTALL_SCRIPTS_DIR}/install-themes.sh" 2>&1 | tee -a "$LOG_FILE"
    log "${GREEN}[SUCCESS]${NC} Themes installed"
}

install_scripts() {
    log "${YELLOW}[INSTALL]${NC} Installing scripts and utilities..."
    bash "${INSTALL_SCRIPTS_DIR}/install-scripts.sh" 2>&1 | tee -a "$LOG_FILE"
    log "${GREEN}[SUCCESS]${NC} Scripts installed"
}

complete_installation() {
    log "${MAGENTA}[START]${NC} Starting complete installation..."
    
    backup_configs
    install_aur_helper
    install_packages
    install_configs
    install_themes
    install_scripts
    
    log "${GREEN}"
    log "╔════════════════════════════════════════════════════════════╗"
    log "║                                                            ║"
    log "║              ✨ INSTALLATION COMPLETED! ✨                ║"
    log "║                                                            ║"
    log "╚════════════════════════════════════════════════════════════╝"
    log "${NC}"
    log "${YELLOW}[NEXT STEPS]${NC}"
    log "1. Logout from your current session"
    log "2. Select 'bspwm' from your display manager"
    log "3. Login and enjoy your new setup!"
    log ""
    log "${CYAN}[KEYBINDINGS]${NC} Press Super+F1 to see all keybindings"
    log "${CYAN}[DOCS]${NC} Check docs/ folder for detailed documentation"
    log "${CYAN}[BACKUP]${NC} Your old configs: ${BACKUP_DIR}"
}

#############################################
# Main
#############################################

# Initialize log file
echo "Installation started at $(date)" > "$LOG_FILE"

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    log "${RED}[ERROR]${NC} This script is designed for Arch Linux only!"
    exit 1
fi

# Main loop
while true; do
    print_header
    print_menu
    read -r choice
    
    case $choice in
        1)
            complete_installation
            break
            ;;
        2)
            install_aur_helper
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        3)
            install_packages
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        4)
            backup_configs
            install_configs
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        5)
            install_themes
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        6)
            install_scripts
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        7)
            backup_configs
            echo -e "\n${GREEN}Press Enter to continue...${NC}"
            read -r
            ;;
        0)
            log "${CYAN}[EXIT]${NC} Installation cancelled by user"
            exit 0
            ;;
        *)
            log "${RED}[ERROR]${NC} Invalid option. Please try again."
            sleep 2
            ;;
    esac
done
