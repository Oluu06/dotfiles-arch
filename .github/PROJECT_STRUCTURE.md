# 📁 Project Structure

Complete overview of the dotfiles repository structure.

```
dotfiles-arch/
│
├── 📄 install.sh                    # Main installation script (interactive menu)
├── 📄 make-executable.sh            # Make all scripts executable
├── 📄 verify-installation.sh        # Verify installation completeness
│
├── 📄 README.md                     # Main documentation
├── 📄 LICENSE                       # MIT License
├── 📄 CONTRIBUTING.md               # Contribution guidelines
├── 📄 CHANGELOG.md                  # Version history
├── 📄 .gitignore                    # Git ignore rules
├── 📄 .gitattributes                # Git attributes
│
├── 📁 install/                      # Installation scripts
│   ├── install-aur.sh              # Install AUR helper (paru)
│   ├── install-packages.sh         # Install all packages
│   ├── install-configs.sh          # Copy configuration files
│   ├── install-themes.sh           # Install themes
│   └── install-scripts.sh          # Install utility scripts
│
├── 📁 config/                       # Application configurations
│   │
│   ├── 📁 bspwm/                   # Window manager
│   │   └── bspwmrc                 # Main bspwm config
│   │
│   ├── 📁 sxhkd/                   # Keybindings
│   │   └── sxhkdrc                 # Keybinding definitions
│   │
│   ├── 📁 polybar/                 # Status bar
│   │   ├── config.ini              # Polybar configuration
│   │   ├── launch.sh               # Launch script
│   │   └── 📁 scripts/             # Polybar modules
│   │       └── updates.sh          # Check for updates
│   │
│   ├── 📁 picom/                   # Compositor
│   │   └── picom.conf              # Picom configuration
│   │
│   ├── 📁 kitty/                   # Terminal
│   │   └── kitty.conf              # Kitty configuration
│   │
│   ├── 📁 rofi/                    # Launcher
│   │   ├── config.rasi             # Main rofi config
│   │   └── 📁 launchers/           # Rofi themes
│   │       ├── launcher.rasi       # App launcher theme
│   │       └── powermenu.rasi      # Power menu theme
│   │
│   ├── 📁 dunst/                   # Notifications
│   │   └── dunstrc                 # Dunst configuration
│   │
│   ├── 📁 zsh/                     # Shell
│   │   ├── .zshrc                  # Zsh configuration
│   │   └── .p10k.zsh               # Powerlevel10k config
│   │
│   ├── 📁 ranger/                  # File manager (TUI)
│   │   └── rc.conf                 # Ranger configuration
│   │
│   ├── 📁 btop/                    # System monitor
│   │   └── btop.conf               # Btop configuration
│   │
│   └── 📁 X11/                     # X11 settings
│       ├── .xinitrc                # X initialization
│       └── .Xresources             # X resources
│
├── 📁 scripts/                      # Utility scripts
│   ├── theme-switcher.sh           # Switch between themes
│   ├── wallpaper-changer.sh        # Change wallpaper with pywal
│   ├── powermenu.sh                # Power menu (logout/reboot/shutdown)
│   ├── screenshot.sh               # Screenshot utility
│   ├── audio-control.sh            # Volume control
│   └── brightness-control.sh       # Brightness control
│
├── 📁 themes/                       # Color themes
│   │
│   ├── 📁 catppuccin-mocha/        # Catppuccin Mocha theme
│   │   ├── colors.sh               # Color definitions
│   │   ├── README.md               # Theme info
│   │   └── 📁 wallpapers/          # Theme wallpapers
│   │       └── .gitkeep
│   │
│   ├── 📁 nord/                    # Nord theme
│   │   ├── colors.sh               # Color definitions
│   │   ├── README.md               # Theme info
│   │   └── 📁 wallpapers/          # Theme wallpapers
│   │       └── .gitkeep
│   │
│   └── 📁 tokyo-night/             # Tokyo Night theme
│       ├── colors.sh               # Color definitions
│       ├── README.md               # Theme info
│       └── 📁 wallpapers/          # Theme wallpapers
│           └── .gitkeep
│
└── 📁 docs/                         # Documentation
    ├── INSTALLATION.md             # Detailed installation guide
    ├── KEYBINDINGS.md              # Complete keybindings reference
    ├── CUSTOMIZATION.md            # Customization guide
    ├── TROUBLESHOOTING.md          # Common issues and solutions
    └── QUICK_START.md              # Quick start guide
```

## 📝 File Descriptions

### Root Level

- **install.sh**: Main installation script with interactive menu
- **make-executable.sh**: Utility to make all scripts executable
- **verify-installation.sh**: Check if installation was successful
- **README.md**: Main project documentation with features and screenshots
- **LICENSE**: MIT License
- **CONTRIBUTING.md**: Guidelines for contributing
- **CHANGELOG.md**: Version history and planned features

### Installation Scripts (`install/`)

All scripts are modular and can be run independently:
- **install-aur.sh**: Installs paru (AUR helper)
- **install-packages.sh**: Installs all required packages
- **install-configs.sh**: Copies configuration files to home directory
- **install-themes.sh**: Sets up color themes
- **install-scripts.sh**: Installs utility scripts to ~/.local/bin

### Configuration Files (`config/`)

Each application has its own directory with complete configuration:
- **bspwm**: Window manager configuration and rules
- **sxhkd**: All keybindings definitions
- **polybar**: Status bar with modules and scripts
- **picom**: Compositor with animations and effects
- **kitty**: Terminal emulator configuration
- **rofi**: Application launcher and menus
- **dunst**: Notification daemon
- **zsh**: Shell configuration with Powerlevel10k
- **ranger**: TUI file manager
- **btop**: System monitor
- **X11**: X server configuration

### Utility Scripts (`scripts/`)

All scripts are installed to `~/.local/bin` and available system-wide:
- **theme-switcher**: Interactive theme selector
- **wallpaper-changer**: Wallpaper manager with pywal integration
- **powermenu**: Power options menu
- **screenshot**: Screenshot utility wrapper
- **audio-control**: Volume control with notifications
- **brightness-control**: Screen brightness control

### Themes (`themes/`)

Three pre-configured themes:
- **catppuccin-mocha**: Default soothing pastel theme
- **nord**: Arctic blue color palette
- **tokyo-night**: Clean dark theme

Each theme includes:
- Color definitions (colors.sh)
- Documentation (README.md)
- Wallpapers directory

### Documentation (`docs/`)

Comprehensive documentation:
- **INSTALLATION.md**: Step-by-step installation guide
- **KEYBINDINGS.md**: Complete keybindings reference
- **CUSTOMIZATION.md**: How to customize everything
- **TROUBLESHOOTING.md**: Solutions to common problems
- **QUICK_START.md**: Get started in 5 minutes

## 🔧 Installation Flow

```
1. install.sh (main)
   ├── install-aur.sh
   ├── install-packages.sh
   ├── install-configs.sh
   │   └── Copies config/* to ~/.config/
   ├── install-themes.sh
   │   └── Copies themes/* to ~/.config/themes/
   └── install-scripts.sh
       └── Copies scripts/* to ~/.local/bin/
```

## 📦 After Installation

Files will be installed to:
```
~/.config/bspwm/
~/.config/sxhkd/
~/.config/polybar/
~/.config/picom/
~/.config/kitty/
~/.config/rofi/
~/.config/dunst/
~/.config/ranger/
~/.config/btop/
~/.config/themes/
~/.local/bin/
~/.local/share/wallpapers/
~/.zshrc
~/.p10k.zsh
~/.xinitrc
~/.Xresources
```

## 🎯 Key Features by Directory

### `config/bspwm/`
- 6 workspaces
- Vim-like navigation
- Window rules
- Auto-start applications

### `config/polybar/`
- Modular design
- Custom modules
- Catppuccin theme
- Update checker

### `config/picom/`
- Smooth animations
- Blur effects
- Rounded corners
- Optimized for performance

### `scripts/`
- All scripts are portable
- Use notifications
- Error handling
- User-friendly

### `themes/`
- Easy to add new themes
- Consistent color scheme
- Automatic application

## 🚀 Usage

```bash
# Clone repository
git clone https://github.com/yourusername/dotfiles-arch.git

# Navigate to directory
cd dotfiles-arch

# Run installer
./install.sh

# Or run individual components
./install/install-packages.sh
./install/install-configs.sh
```

## 📚 Related Files

- See [INSTALLATION.md](docs/INSTALLATION.md) for installation details
- See [CUSTOMIZATION.md](docs/CUSTOMIZATION.md) for customization options
- See [README.md](README.md) for overview and features

---

**Note**: This structure is designed to be modular, maintainable, and easy to understand. Each component can be modified independently without affecting others.
