# 📦 Installation Guide

Complete installation guide for Arch Linux Dotfiles.

---

## 📋 Prerequisites

### System Requirements
- **OS**: Arch Linux or Arch-based distribution
- **Display Server**: X11 (Wayland not supported)
- **Internet Connection**: Required for downloading packages
- **Disk Space**: ~2GB for all packages and dependencies

### Before Installation
1. Ensure your system is up to date:
   ```bash
   sudo pacman -Syu
   ```

2. Install git if not already installed:
   ```bash
   sudo pacman -S git
   ```

---

## 🚀 Automatic Installation (Recommended)

### Step 1: Clone Repository

```bash
cd ~
git clone https://github.com/yourusername/dotfiles-arch.git
cd dotfiles-arch
```

### Step 2: Run Installer

```bash
chmod +x install.sh
./install.sh
```

### Step 3: Choose Installation Type

The installer will present you with a menu:

```
[1] Complete Installation (Recommended)
[2] Install AUR Helper (paru)
[3] Install Packages Only
[4] Install Configurations Only
[5] Install Themes
[6] Install Scripts & Utilities
[7] Backup Current Configs
[0] Exit
```

**For first-time installation, choose option [1]**.

### Step 4: Wait for Installation

The installer will:
- ✅ Create backup of existing configurations
- ✅ Install paru (AUR helper)
- ✅ Install all required packages
- ✅ Copy configuration files
- ✅ Install themes
- ✅ Set up utility scripts
- ✅ Configure zsh as default shell

This process may take 10-30 minutes depending on your internet speed.

### Step 5: Post-Installation

1. **Logout** from your current session
2. At the login screen, select **bspwm** from the session menu
3. **Login** with your credentials
4. Enjoy your new setup! 🎉

---

## 🔧 Manual Installation

If you prefer to install components manually:

### 1. Install AUR Helper

```bash
cd ~/dotfiles-arch
bash install/install-aur.sh
```

### 2. Install Packages

```bash
bash install/install-packages.sh
```

### 3. Install Configurations

```bash
# Backup existing configs first
mkdir -p ~/.dotfiles-backup
cp -r ~/.config/bspwm ~/.dotfiles-backup/ 2>/dev/null || true
cp -r ~/.config/polybar ~/.dotfiles-backup/ 2>/dev/null || true
# ... backup other configs

# Install new configs
bash install/install-configs.sh
```

### 4. Install Themes

```bash
bash install/install-themes.sh
```

### 5. Install Scripts

```bash
bash install/install-scripts.sh
```

---

## 🎨 First Launch Setup

### Configure Powerlevel10k

On first terminal launch, Powerlevel10k will ask you to configure the prompt:

```bash
p10k configure
```

Follow the interactive wizard to customize your prompt.

### Set Up Wallpaper

1. Add your wallpapers to `~/.local/share/wallpapers/`
2. Set a wallpaper:
   ```bash
   wallpaper-changer
   ```

### Generate Lock Screen Cache

```bash
betterlockscreen -u ~/.local/share/wallpapers/default.jpg
```

---

## 🔄 Updating

To update your dotfiles:

```bash
cd ~/dotfiles-arch
git pull
./install.sh
# Choose option [4] to update configurations only
```

---

## 🗑️ Uninstallation

To restore your previous configuration:

```bash
# Your backups are stored in ~/.dotfiles-backup-TIMESTAMP/
ls -la ~ | grep dotfiles-backup

# Restore from backup
cp -r ~/.dotfiles-backup-TIMESTAMP/.config/* ~/.config/
```

To completely remove:

```bash
# Remove configurations
rm -rf ~/.config/bspwm
rm -rf ~/.config/sxhkd
rm -rf ~/.config/polybar
rm -rf ~/.config/picom
rm -rf ~/.config/kitty
rm -rf ~/.config/rofi
rm -rf ~/.config/dunst
rm -rf ~/.config/themes
rm -rf ~/.local/bin/theme-switcher*
rm -rf ~/.local/bin/wallpaper-changer*
rm -rf ~/.local/bin/powermenu*
rm -rf ~/.local/bin/screenshot*
rm -rf ~/.local/bin/audio-control*
rm -rf ~/.local/bin/brightness-control*

# Restore original shell config
rm ~/.zshrc
rm ~/.p10k.zsh
```

---

## 🐛 Installation Issues

### Package Installation Fails

```bash
# Update package database
sudo pacman -Sy

# Clear package cache
sudo pacman -Sc

# Try again
./install.sh
```

### AUR Helper Installation Fails

```bash
# Install dependencies manually
sudo pacman -S base-devel git

# Try again
bash install/install-aur.sh
```

### Permission Errors

```bash
# Ensure install scripts are executable
chmod +x install.sh
chmod +x install/*.sh
```

### Missing Dependencies

```bash
# Install base-devel group
sudo pacman -S base-devel

# Install git
sudo pacman -S git
```

---

## 📝 Installation Log

All installation activities are logged to `install.log` in the project directory.

To view the log:
```bash
cat install.log
```

---

## ✅ Verification

After installation, verify everything is working:

### Check Services
```bash
# Check if bspwm is running
pgrep bspwm

# Check if polybar is running
pgrep polybar

# Check if picom is running
pgrep picom

# Check if sxhkd is running
pgrep sxhkd
```

### Test Keybindings
- Press `Super + Enter` - Should open kitty terminal
- Press `Super + Space` - Should open rofi launcher
- Press `Super + F1` - Should show keybindings

### Test Scripts
```bash
# Test theme switcher
theme-switcher

# Test wallpaper changer
wallpaper-changer

# Test screenshot
screenshot
```

---

## 🎯 Next Steps

1. Read [KEYBINDINGS.md](KEYBINDINGS.md) to learn all shortcuts
2. Read [CUSTOMIZATION.md](CUSTOMIZATION.md) to personalize your setup
3. Add your favorite wallpapers to `~/.local/share/wallpapers/`
4. Customize colors in `~/.config/themes/`
5. Join [r/unixporn](https://reddit.com/r/unixporn) to share your rice!

---

## 💡 Tips

- **Backup regularly**: Your configs are precious!
- **Experiment**: Don't be afraid to modify configurations
- **Learn keybindings**: They'll make you much more productive
- **Use the wiki**: Arch Wiki is your best friend
- **Ask for help**: The community is friendly and helpful

---

Need help? Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or open an issue!
