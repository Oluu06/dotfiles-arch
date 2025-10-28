# 🎨 Customization Guide

Learn how to customize your Arch Linux dotfiles to match your preferences.

---

## 🌈 Themes

### Switching Themes

The dotfiles come with three pre-configured themes:
- **Catppuccin Mocha** (default)
- **Nord**
- **Tokyo Night**

#### Using Theme Switcher

```bash
# Interactive mode
theme-switcher

# Direct theme application
theme-switcher catppuccin-mocha
theme-switcher nord
theme-switcher tokyo-night
```

The theme switcher will automatically:
- ✅ Update all application colors
- ✅ Change wallpaper
- ✅ Reload bspwm, polybar, picom, and dunst
- ✅ Generate pywal colors

### Creating Custom Themes

1. **Create theme directory:**
   ```bash
   mkdir -p ~/.config/themes/my-theme/wallpapers
   ```

2. **Create color scheme:**
   ```bash
   nano ~/.config/themes/my-theme/colors.sh
   ```

   Example:
   ```bash
   #!/bin/bash
   export BG="#1e1e2e"
   export FG="#cdd6f4"
   export PRIMARY="#89b4fa"
   export SECONDARY="#f5c2e7"
   export ALERT="#f38ba8"
   # Add more colors as needed
   ```

3. **Add wallpapers:**
   ```bash
   cp your-wallpaper.jpg ~/.config/themes/my-theme/wallpapers/default.jpg
   ```

4. **Apply theme:**
   ```bash
   theme-switcher my-theme
   ```

---

## 🖼️ Wallpapers

### Adding Wallpapers

```bash
# Copy wallpapers to the directory
cp /path/to/wallpaper.jpg ~/.local/share/wallpapers/

# Or download directly
wget -P ~/.local/share/wallpapers/ https://example.com/wallpaper.jpg
```

### Changing Wallpaper

```bash
# Interactive selector
wallpaper-changer

# Random wallpaper
wallpaper-changer random

# Specific wallpaper
wallpaper-changer ~/.local/share/wallpapers/my-wallpaper.jpg
```

### Automatic Wallpaper Rotation

Add to `~/.config/bspwm/bspwmrc`:
```bash
# Change wallpaper every 30 minutes
while true; do
    sleep 1800
    wallpaper-changer random
done &
```

---

## 🎨 Colors

### Polybar Colors

Edit `~/.config/polybar/config.ini`:

```ini
[colors]
background = #1e1e2e
foreground = #cdd6f4
primary = #89b4fa
secondary = #f5c2e7
alert = #f38ba8
```

### Kitty Colors

Edit `~/.config/kitty/kitty.conf`:

```conf
# Change background
background #1e1e2e

# Change foreground
foreground #cdd6f4

# Change cursor
cursor #f5e0dc
```

### Rofi Colors

Edit `~/.config/rofi/launchers/launcher.rasi`:

```css
* {
    bg: #1e1e2e;
    fg: #cdd6f4;
    primary: #89b4fa;
}
```

### Using Pywal

Pywal automatically generates color schemes from wallpapers:

```bash
# Generate colors from wallpaper
wal -i /path/to/wallpaper.jpg

# Preview colors
cat ~/.cache/wal/colors.sh
```

---

## 🪟 Window Manager (bspwm)

### Border Settings

Edit `~/.config/bspwm/bspwmrc`:

```bash
# Border width (default: 2)
bspc config border_width 2

# Window gap (default: 12)
bspc config window_gap 12

# Border colors
bspc config normal_border_color "#313244"
bspc config focused_border_color "#89b4fa"
```

### Workspace Configuration

```bash
# Change number of workspaces
bspc monitor -d 1 2 3 4 5 6 7 8

# Rename workspaces with icons
bspc monitor -d    
```

### Window Rules

Add custom rules in `~/.config/bspwm/bspwmrc`:

```bash
# Make specific app floating
bspc rule -a MyApp state=floating

# Assign app to specific workspace
bspc rule -a Firefox desktop='^2'

# Center floating window
bspc rule -a MyApp state=floating center=true rectangle=800x600+0+0
```

---

## 📊 Polybar

### Adding Modules

Edit `~/.config/polybar/config.ini`:

```ini
[bar/main]
modules-left = bspwm xwindow
modules-center = date
modules-right = updates pulseaudio memory cpu network tray
```

### Custom Module Example

```ini
[module/custom]
type = custom/script
exec = echo "Hello"
interval = 5
format-prefix = " "
format-prefix-foreground = ${colors.primary}
```

### Module Positioning

```ini
# Left side
modules-left = module1 module2

# Center
modules-center = module3

# Right side
modules-right = module4 module5
```

### Bar Height and Position

```ini
[bar/main]
width = 100%
height = 30
offset-x = 0
offset-y = 0
bottom = false  # Set to true for bottom bar
```

---

## 💻 Terminal (Kitty)

### Font Configuration

Edit `~/.config/kitty/kitty.conf`:

```conf
# Font family
font_family JetBrainsMono Nerd Font

# Font size
font_size 11.0

# Font features
font_features JetBrainsMonoNerdFont-Regular +liga +calt
```

### Opacity

```conf
# Background opacity (0.0 - 1.0)
background_opacity 0.95
```

### Padding

```conf
# Window padding
window_padding_width 10
```

---

## 🎭 Compositor (Picom)

### Animation Speed

Edit `~/.config/picom/picom.conf`:

```conf
# Fade speed (lower = faster)
fade-in-step = 0.03
fade-out-step = 0.03

# Animation settings
animation-stiffness = 200
animation-dampening = 20
```

### Blur Strength

```conf
# Blur method
blur-method = "dual_kawase"

# Blur strength (1-20)
blur-strength = 5
```

### Corner Radius

```conf
# Rounded corners radius
corner-radius = 10
```

### Opacity Rules

```conf
opacity-rule = [
    "100:class_g = 'kitty' && focused",
    "95:class_g = 'kitty' && !focused",
    "100:class_g = 'firefox'"
]
```

---

## 🔔 Notifications (Dunst)

### Notification Position

Edit `~/.config/dunst/dunstrc`:

```ini
[global]
origin = top-right
offset = 20x50
```

### Notification Size

```ini
width = (0, 400)
height = 300
```

### Timeout

```ini
[urgency_normal]
timeout = 10

[urgency_critical]
timeout = 0  # Never timeout
```

---

## ⌨️ Keybindings

### Modifying Keybindings

Edit `~/.config/sxhkd/sxhkdrc`:

```bash
# Example: Change terminal keybinding
super + Return
    kitty

# Example: Add new keybinding
super + shift + f
    firefox
```

### Reload Keybindings

After editing:
```bash
pkill -USR1 -x sxhkd
```

Or press `Super + Escape`

---

## 🐚 Shell (Zsh)

### Powerlevel10k Configuration

```bash
# Reconfigure prompt
p10k configure
```

### Adding Aliases

Edit `~/.zshrc`:

```bash
# Custom aliases
alias myalias='command'
alias update='paru -Syu'
```

### Adding Functions

```bash
# Custom function
myfunction() {
    echo "Hello from function"
}
```

---

## 🚀 Startup Applications

### Autostart Apps

Edit `~/.config/bspwm/bspwmrc`:

```bash
# Add at the end of file
discord &
spotify &
```

### Conditional Startup

```bash
# Start only if not running
if ! pgrep -x "myapp" > /dev/null; then
    myapp &
fi
```

---

## 📱 Application-Specific Settings

### Firefox

For better integration:
1. Install theme: [Firefox Color](https://color.firefox.com/)
2. Match colors with your theme
3. Enable custom CSS in `about:config`

### VS Code

Install extensions:
- Catppuccin Theme
- Material Icon Theme

### Discord

Install BetterDiscord with Catppuccin theme

---

## 🔧 Advanced Customization

### Multi-Monitor Setup

Edit `~/.config/bspwm/bspwmrc`:

```bash
# Detect monitors
if xrandr -q | grep "HDMI-1 connected"; then
    bspc monitor eDP-1 -d 1 2 3
    bspc monitor HDMI-1 -d 4 5 6
else
    bspc monitor -d 1 2 3 4 5 6
fi
```

### HiDPI Settings

Edit `~/.config/X11/.Xresources`:

```
Xft.dpi: 192
```

### Custom Scripts

Create scripts in `~/.local/bin/`:

```bash
#!/bin/bash
# my-script.sh
echo "My custom script"
```

Make executable:
```bash
chmod +x ~/.local/bin/my-script.sh
```

---

## 💾 Backup Your Customizations

```bash
# Backup entire config
tar -czf dotfiles-backup-$(date +%Y%m%d).tar.gz ~/.config

# Backup specific configs
cp -r ~/.config/bspwm ~/backups/
```

---

## 📚 Resources

- [Catppuccin Palette](https://github.com/catppuccin/catppuccin)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Polybar Wiki](https://github.com/polybar/polybar/wiki)
- [bspwm Examples](https://github.com/baskerville/bspwm/tree/master/examples)
- [r/unixporn](https://reddit.com/r/unixporn)

---

## 💡 Tips

1. **Test before committing**: Always test changes in a separate session
2. **Keep backups**: Before major changes, backup your configs
3. **Document changes**: Comment your modifications
4. **Share your rice**: Post to r/unixporn and get feedback
5. **Iterate**: Customization is a journey, not a destination

---

Need help? Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or open an issue!
