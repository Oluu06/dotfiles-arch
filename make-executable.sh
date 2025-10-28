#!/bin/bash

#############################################
# Make all scripts executable
# Run this before committing to Git
#############################################

echo "Making scripts executable..."

# Main installer
chmod +x install.sh

# Installation scripts
chmod +x install/*.sh

# Utility scripts
chmod +x scripts/*.sh

# Config scripts
chmod +x config/bspwm/bspwmrc
chmod +x config/polybar/launch.sh
chmod +x config/polybar/scripts/*.sh 2>/dev/null || true

# Theme scripts
chmod +x themes/*/colors.sh 2>/dev/null || true

echo "Done! All scripts are now executable."
