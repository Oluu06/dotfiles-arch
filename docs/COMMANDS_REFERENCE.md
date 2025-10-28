# 🔧 Commands Reference

Quick reference for all available commands and utilities.

---

## 🚀 Installation Commands

```bash
# Complete installation
./install.sh

# Individual components
./install/install-aur.sh
./install/install-packages.sh
./install/install-configs.sh
./install/install-themes.sh
./install/install-scripts.sh

# Verify installation
./verify-installation.sh

# Make scripts executable
./make-executable.sh
```

---

## 🎨 Theme Management

```bash
# Interactive theme switcher
theme-switcher

# Switch to specific theme
theme-switcher catppuccin-mocha
theme-switcher nord
theme-switcher tokyo-night
```

---

## 🖼️ Wallpaper Management

```bash
# Interactive wallpaper selector
wallpaper-changer

# Random wallpaper
wallpaper-changer random

# Set specific wallpaper
wallpaper-changer /path/to/image.jpg
```

---

## 📸 Screenshots

```bash
# Interactive selection
screenshot

# Full screen
screenshot full

# Current window
screenshot window
```

---

## 🔊 Audio Control

```bash
# Volume up
audio-control up

# Volume down
audio-control down

# Toggle mute
audio-control mute
```

---

## 💡 Brightness Control

```bash
# Increase brightness
brightness-control up

# Decrease brightness
brightness-control down
```

---

## 🪟 Window Manager

```bash
# Reload bspwm
bspc wm -r

# Close window
bspc node -c

# Toggle fullscreen
bspc node -t fullscreen
```

---

## ⌨️ Keybindings

```bash
# Reload sxhkd
pkill -USR1 -x sxhkd

# View keybindings
less ~/.config/sxhkd/sxhkdrc
```

---

## 📊 Status Bar

```bash
# Restart polybar
~/.config/polybar/launch.sh

# Check log
cat /tmp/polybar.log
```

---

## 🎭 Compositor

```bash
# Restart picom
killall picom && picom --config ~/.config/picom/picom.conf &
```

---

## 🔔 Notifications

```bash
# Test notification
notify-send "Test" "This is a test"

# Restart dunst
killall dunst && dunst &
```

---

## 🐚 Shell

```bash
# Reload zsh config
source ~/.zshrc

# Configure Powerlevel10k
p10k configure
```

---

## 📦 Package Management

```bash
# Update system
paru -Syu

# Install package
paru -S package-name

# Remove package
paru -Rns package-name

# Search package
paru -Ss search-term

# Clean cache
paru -Sc
```

---

## 🔒 Lock Screen

```bash
# Lock screen
betterlockscreen -l

# Update lock screen cache
betterlockscreen -u /path/to/wallpaper.jpg
```

---

## 📁 File Management

```bash
# Open thunar
thunar

# Open ranger
ranger

# Quick navigation
cd ~/.config
cd ~/.local/bin
```

---

## 🖥️ System Monitoring

```bash
# System monitor
btop

# System info
neofetch

# Disk usage
df -h

# Memory usage
free -h
```

---

## 🔍 Debugging

```bash
# Check running processes
ps aux | grep bspwm
ps aux | grep polybar
ps aux | grep picom

# View logs
journalctl -xe
cat ~/.xsession-errors

# Check X server
xrandr
xprop
```

---

## 🛠️ Configuration Editing

```bash
# Edit bspwm config
nvim ~/.config/bspwm/bspwmrc

# Edit keybindings
nvim ~/.config/sxhkd/sxhkdrc

# Edit polybar config
nvim ~/.config/polybar/config.ini

# Edit zsh config
nvim ~/.zshrc
```

---

## 🔄 Quick Fixes

```bash
# Restart all components
~/.config/bspwm/bspwmrc

# Reset gaps
bspc config window_gap 12

# Fix polybar
killall polybar && ~/.config/polybar/launch.sh

# Fix compositor
killall picom && picom --config ~/.config/picom/picom.conf &
```

---

## 📚 Help Commands

```bash
# Show all keybindings
Super + F1

# Man pages
man bspwm
man sxhkd
man polybar

# Command help
bspc --help
rofi --help
```

---

**Tip**: Add these to your aliases in `~/.zshrc` for quicker access!
