# 🚀 Arch Linux Dotfiles

<div align="center">

![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![bspwm](https://img.shields.io/badge/bspwm-000000?style=for-the-badge&logo=windowmaker&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Maintained](https://img.shields.io/badge/Maintained-Yes-green?style=for-the-badge)

**Modern • Fluid • Minimal**

A beautiful and functional Arch Linux rice featuring bspwm, polybar, and Catppuccin Mocha theme.

[Features](#-features) • [Installation](#-installation) • [Keybindings](#-keybindings) • [Customization](#-customization) • [Screenshots](#-screenshots)

</div>

---

## ✨ Features

### 🎨 **Visual Excellence**
- **Theme**: Catppuccin Mocha (with Nord and Tokyo Night alternatives)
- **Compositor**: picom-pijulius-git with smooth animations and blur effects
- **Bar**: Polybar with custom modules and beautiful design
- **Launcher**: Rofi with blur and modern styling
- **Notifications**: Dunst with Catppuccin theme

### ⚡ **Performance & Fluidity**
- GPU-accelerated terminal (kitty)
- Optimized compositor settings for smooth animations
- Minimal resource usage
- Fast and responsive UI

### 🛠️ **Functionality**
- Complete window management with bspwm
- Intuitive keybindings (vim-like)
- Dynamic color schemes with pywal
- Theme switcher for easy customization
- Utility scripts for common tasks
- Automatic backups during installation

### 📦 **Included Applications**
- **WM**: bspwm + sxhkd
- **Bar**: Polybar
- **Compositor**: picom-pijulius-git
- **Terminal**: kitty
- **Shell**: zsh with Powerlevel10k
- **Launcher**: rofi
- **File Manager**: thunar (GUI) + ranger (TUI)
- **Notifications**: dunst
- **Lock Screen**: betterlockscreen
- **System Monitor**: btop++
- **Screenshots**: flameshot

---

## 📋 Requirements

- **OS**: Arch Linux (or Arch-based distribution)
- **Display Server**: X11
- **AUR Helper**: paru (will be installed automatically)
- **Internet Connection**: Required for package installation

---

## 🚀 Installation

### Quick Install (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles-arch.git
cd dotfiles-arch

# Make install script executable
chmod +x install.sh

# Run the installer
./install.sh
```

The installer will:
1. ✅ Backup your existing configurations
2. ✅ Install all required packages
3. ✅ Copy configuration files
4. ✅ Set up themes and scripts
5. ✅ Configure everything automatically

### Post-Installation

1. **Logout** from your current session
2. Select **bspwm** from your display manager
3. **Login** and enjoy your new setup!

For detailed installation instructions, see [INSTALLATION.md](docs/INSTALLATION.md)

---

## ⌨️ Keybindings

### Essential Shortcuts

| Keybinding | Action |
|------------|--------|
| `Super + Enter` | Open terminal |
| `Super + Space` | Application launcher |
| `Super + Shift + Q` | Close window |
| `Super + Shift + R` | Reload bspwm |
| `Super + L` | Lock screen |
| `Super + Shift + S` | Screenshot (selection) |
| `Super + F1` | Show all keybindings |

### Window Management

| Keybinding | Action |
|------------|--------|
| `Super + H/J/K/L` | Navigate windows (vim keys) |
| `Super + Shift + H/J/K/L` | Move window |
| `Super + F` | Toggle fullscreen |
| `Super + T` | Set tiling mode |
| `Super + Shift + Space` | Toggle floating |

### Workspaces

| Keybinding | Action |
|------------|--------|
| `Super + 1-6` | Switch to workspace |
| `Super + Shift + 1-6` | Move window to workspace |

For complete keybindings list, see [KEYBINDINGS.md](docs/KEYBINDINGS.md)

---

## 🎨 Customization

### Switching Themes

```bash
# Interactive theme switcher
theme-switcher

# Or directly
theme-switcher catppuccin-mocha
theme-switcher nord
theme-switcher tokyo-night
```

### Changing Wallpaper

```bash
# Interactive wallpaper changer
wallpaper-changer

# Random wallpaper
wallpaper-changer random

# Specific wallpaper
wallpaper-changer /path/to/image.jpg
```

### Available Utilities

- `screenshot` - Take screenshots
- `wallpaper-changer` - Change wallpaper with pywal
- `powermenu` - Power menu (logout/reboot/shutdown)
- `theme-switcher` - Switch between themes
- `audio-control` - Control volume
- `brightness-control` - Control brightness

For detailed customization guide, see [CUSTOMIZATION.md](docs/CUSTOMIZATION.md)

---

## 📸 Screenshots

> Add your screenshots here after installation

---

## 📁 Project Structure

```
dotfiles-arch/
├── config/              # Application configurations
│   ├── bspwm/          # Window manager config
│   ├── sxhkd/          # Keybindings
│   ├── polybar/        # Status bar
│   ├── picom/          # Compositor
│   ├── kitty/          # Terminal
│   ├── rofi/           # Launcher
│   ├── dunst/          # Notifications
│   ├── zsh/            # Shell config
│   └── ...
├── scripts/            # Utility scripts
├── themes/             # Color themes
│   ├── catppuccin-mocha/
│   ├── nord/
│   └── tokyo-night/
├── install/            # Installation scripts
├── docs/               # Documentation
├── install.sh          # Main installer
└── README.md           # This file
```

---

## 🔧 Troubleshooting

### Common Issues

**Q: Polybar doesn't show up**
```bash
# Check polybar log
cat /tmp/polybar.log

# Restart polybar
~/.config/polybar/launch.sh
```

**Q: Compositor not working**
```bash
# Check if picom is running
pgrep picom

# Restart picom
killall picom && picom --config ~/.config/picom/picom.conf &
```

**Q: Keybindings not working**
```bash
# Reload sxhkd
pkill -USR1 -x sxhkd
```

For more troubleshooting, see [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Share your customizations

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

### Themes
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Soothing pastel theme
- [Nord](https://www.nordtheme.com/) - Arctic, north-bluish color palette
- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme) - Clean, dark theme

### Inspiration
- [r/unixporn](https://reddit.com/r/unixporn) - For endless inspiration
- Arch Linux community - For amazing documentation

---

## 📧 Contact

If you have any questions or suggestions, feel free to open an issue!

---

<div align="center">

**Made with ❤️ for the Arch Linux community**

⭐ If you like this project, please give it a star!

</div>
