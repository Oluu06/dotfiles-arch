# 🔧 Troubleshooting Guide

Solutions to common issues and problems.

---

## 🚨 Installation Issues

### Package Installation Fails

**Problem**: Packages fail to install during setup

**Solutions**:
```bash
# Update package database
sudo pacman -Sy

# Update keyring
sudo pacman -S archlinux-keyring

# Clear package cache
sudo pacman -Sc

# Try installation again
./install.sh
```

### AUR Helper Installation Fails

**Problem**: paru installation fails

**Solutions**:
```bash
# Install dependencies
sudo pacman -S base-devel git

# Remove partial installation
rm -rf ~/.cache/paru

# Try again
bash install/install-aur.sh
```

### Permission Denied Errors

**Problem**: Scripts can't be executed

**Solutions**:
```bash
# Make scripts executable
chmod +x install.sh
chmod +x install/*.sh
chmod +x scripts/*.sh

# Check ownership
ls -la install.sh
```

---

## 🪟 Window Manager Issues

### bspwm Doesn't Start

**Problem**: Black screen after login

**Solutions**:

1. **Check if bspwm is installed:**
   ```bash
   which bspwm
   ```

2. **Check .xinitrc:**
   ```bash
   cat ~/.xinitrc
   # Should contain: exec bspwm
   ```

3. **Check bspwmrc permissions:**
   ```bash
   ls -la ~/.config/bspwm/bspwmrc
   chmod +x ~/.config/bspwm/bspwmrc
   ```

4. **Check logs:**
   ```bash
   # From TTY (Ctrl+Alt+F2)
   cat ~/.xsession-errors
   ```

### Keybindings Don't Work

**Problem**: Keyboard shortcuts not responding

**Solutions**:

1. **Check if sxhkd is running:**
   ```bash
   pgrep sxhkd
   ```

2. **Restart sxhkd:**
   ```bash
   killall sxhkd
   sxhkd &
   ```

3. **Check sxhkdrc syntax:**
   ```bash
   sxhkd -p
   # Should show no errors
   ```

4. **Reload configuration:**
   ```bash
   pkill -USR1 -x sxhkd
   ```

### Windows Have No Borders

**Problem**: Can't see window borders

**Solutions**:

1. **Check border settings:**
   ```bash
   bspc config border_width
   # Should return a number > 0
   ```

2. **Set border width:**
   ```bash
   bspc config border_width 2
   ```

3. **Reload bspwm:**
   ```bash
   ~/.config/bspwm/bspwmrc
   ```

---

## 📊 Polybar Issues

### Polybar Doesn't Show

**Problem**: Status bar is missing

**Solutions**:

1. **Check if polybar is running:**
   ```bash
   pgrep polybar
   ```

2. **Check logs:**
   ```bash
   cat /tmp/polybar.log
   ```

3. **Restart polybar:**
   ```bash
   killall polybar
   ~/.config/polybar/launch.sh
   ```

4. **Check configuration:**
   ```bash
   polybar --config=~/.config/polybar/config.ini main
   ```

### Polybar Modules Not Working

**Problem**: Specific modules show errors or don't display

**Solutions**:

1. **Check module dependencies:**
   ```bash
   # For network module
   which nmcli
   
   # For audio module
   which pamixer
   ```

2. **Check script permissions:**
   ```bash
   chmod +x ~/.config/polybar/scripts/*.sh
   ```

3. **Test script manually:**
   ```bash
   ~/.config/polybar/scripts/updates.sh
   ```

### Polybar Icons Not Showing

**Problem**: Icons appear as squares or missing

**Solutions**:

1. **Install Nerd Fonts:**
   ```bash
   paru -S ttf-jetbrains-mono-nerd
   ```

2. **Rebuild font cache:**
   ```bash
   fc-cache -fv
   ```

3. **Check font in config:**
   ```bash
   grep "font-" ~/.config/polybar/config.ini
   ```

---

## 🎨 Compositor Issues

### Picom Not Starting

**Problem**: No transparency or effects

**Solutions**:

1. **Check if picom is running:**
   ```bash
   pgrep picom
   ```

2. **Check for errors:**
   ```bash
   picom --config ~/.config/picom/picom.conf
   # Look for error messages
   ```

3. **Try different backend:**
   Edit `~/.config/picom/picom.conf`:
   ```conf
   backend = "xrender";  # Instead of glx
   ```

4. **Disable problematic features:**
   ```conf
   blur-background = false;
   animations = false;
   ```

### Screen Tearing

**Problem**: Visible tearing during animations

**Solutions**:

1. **Enable vsync:**
   ```conf
   vsync = true;
   ```

2. **Try different backend:**
   ```conf
   backend = "glx";
   ```

3. **Add to picom config:**
   ```conf
   glx-no-stencil = true;
   glx-no-rebind-pixmap = true;
   ```

### Blur Not Working

**Problem**: Blur effect not visible

**Solutions**:

1. **Check blur settings:**
   ```conf
   blur-method = "dual_kawase";
   blur-strength = 5;
   blur-background = true;
   ```

2. **Ensure GLX backend:**
   ```conf
   backend = "glx";
   ```

3. **Check exclusions:**
   ```conf
   blur-background-exclude = [
       # Remove or comment problematic exclusions
   ];
   ```

---

## 💻 Terminal Issues

### Kitty Won't Start

**Problem**: Terminal doesn't open

**Solutions**:

1. **Check if installed:**
   ```bash
   which kitty
   ```

2. **Test from another terminal:**
   ```bash
   kitty
   # Check error messages
   ```

3. **Reset configuration:**
   ```bash
   mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak
   kitty
   ```

### Fonts Look Wrong

**Problem**: Ligatures or icons not displaying

**Solutions**:

1. **Install Nerd Fonts:**
   ```bash
   paru -S ttf-jetbrains-mono-nerd
   ```

2. **Check font in kitty.conf:**
   ```conf
   font_family JetBrainsMono Nerd Font
   ```

3. **Rebuild font cache:**
   ```bash
   fc-cache -fv
   ```

### Colors Are Wrong

**Problem**: Terminal colors don't match theme

**Solutions**:

1. **Check kitty theme:**
   ```bash
   cat ~/.config/kitty/kitty.conf | grep "color"
   ```

2. **Apply pywal colors:**
   ```bash
   wal -R
   ```

3. **Restart kitty:**
   ```bash
   killall kitty
   ```

---

## 🚀 Rofi Issues

### Rofi Doesn't Show

**Problem**: Launcher doesn't appear

**Solutions**:

1. **Test rofi:**
   ```bash
   rofi -show drun
   ```

2. **Check theme path:**
   ```bash
   ls ~/.config/rofi/launchers/launcher.rasi
   ```

3. **Use default theme:**
   ```bash
   rofi -show drun -theme default
   ```

### Rofi Icons Missing

**Problem**: Application icons not showing

**Solutions**:

1. **Install icon theme:**
   ```bash
   paru -S papirus-icon-theme
   ```

2. **Set icon theme:**
   Edit `~/.config/rofi/config.rasi`:
   ```css
   icon-theme: "Papirus-Dark";
   ```

3. **Enable icons:**
   ```css
   show-icons: true;
   ```

---

## 🔔 Notification Issues

### Dunst Not Showing Notifications

**Problem**: No notifications appear

**Solutions**:

1. **Check if dunst is running:**
   ```bash
   pgrep dunst
   ```

2. **Restart dunst:**
   ```bash
   killall dunst
   dunst &
   ```

3. **Test notification:**
   ```bash
   notify-send "Test" "This is a test notification"
   ```

4. **Check dunst config:**
   ```bash
   dunst -config ~/.config/dunst/dunstrc -print
   ```

### Notifications in Wrong Position

**Problem**: Notifications appear in wrong location

**Solutions**:

Edit `~/.config/dunst/dunstrc`:
```ini
origin = top-right
offset = 20x50
```

---

## 🎨 Theme Issues

### Theme Switcher Not Working

**Problem**: Theme doesn't change

**Solutions**:

1. **Check theme directory:**
   ```bash
   ls ~/.config/themes/
   ```

2. **Check symlink:**
   ```bash
   ls -la ~/.config/themes/current
   ```

3. **Apply theme manually:**
   ```bash
   theme-switcher catppuccin-mocha
   ```

### Pywal Colors Not Applied

**Problem**: Colors don't match wallpaper

**Solutions**:

1. **Check if pywal is installed:**
   ```bash
   which wal
   ```

2. **Generate colors:**
   ```bash
   wal -i /path/to/wallpaper.jpg
   ```

3. **Check cache:**
   ```bash
   cat ~/.cache/wal/colors.sh
   ```

4. **Reload applications:**
   ```bash
   ~/.config/polybar/launch.sh
   ```

---

## 🖼️ Wallpaper Issues

### Wallpaper Not Setting

**Problem**: Wallpaper doesn't change

**Solutions**:

1. **Check if feh is installed:**
   ```bash
   which feh
   ```

2. **Set wallpaper manually:**
   ```bash
   feh --bg-fill /path/to/wallpaper.jpg
   ```

3. **Check wallpaper directory:**
   ```bash
   ls ~/.local/share/wallpapers/
   ```

### Betterlockscreen Not Working

**Problem**: Lock screen shows black screen

**Solutions**:

1. **Generate cache:**
   ```bash
   betterlockscreen -u /path/to/wallpaper.jpg
   ```

2. **Check cache:**
   ```bash
   ls ~/.cache/betterlockscreen/
   ```

3. **Use default lock:**
   ```bash
   i3lock -c 000000
   ```

---

## 🔊 Audio Issues

### Volume Controls Not Working

**Problem**: Volume keys don't respond

**Solutions**:

1. **Check if pamixer is installed:**
   ```bash
   which pamixer
   ```

2. **Test volume control:**
   ```bash
   pamixer -i 5  # Increase
   pamixer -d 5  # Decrease
   ```

3. **Check PulseAudio:**
   ```bash
   pulseaudio --check
   pulseaudio --start
   ```

### No Sound

**Problem**: System has no audio output

**Solutions**:

1. **Check audio devices:**
   ```bash
   pactl list sinks
   ```

2. **Unmute:**
   ```bash
   pamixer -u
   ```

3. **Set default sink:**
   ```bash
   pactl set-default-sink <sink-name>
   ```

---

## 🖥️ Display Issues

### Wrong Resolution

**Problem**: Display resolution is incorrect

**Solutions**:

1. **Check available resolutions:**
   ```bash
   xrandr
   ```

2. **Set resolution:**
   ```bash
   xrandr --output eDP-1 --mode 1920x1080
   ```

3. **Add to bspwmrc:**
   ```bash
   xrandr --output eDP-1 --mode 1920x1080 &
   ```

### Multi-Monitor Issues

**Problem**: Second monitor not detected

**Solutions**:

1. **Detect monitors:**
   ```bash
   xrandr --auto
   ```

2. **Configure monitors:**
   ```bash
   xrandr --output HDMI-1 --right-of eDP-1 --auto
   ```

3. **Add to bspwmrc:**
   ```bash
   if xrandr -q | grep "HDMI-1 connected"; then
       xrandr --output HDMI-1 --right-of eDP-1 --auto
       bspc monitor eDP-1 -d 1 2 3
       bspc monitor HDMI-1 -d 4 5 6
   fi
   ```

---

## 🐚 Shell Issues

### Zsh Not Default Shell

**Problem**: Still using bash

**Solutions**:

```bash
# Change default shell
chsh -s $(which zsh)

# Logout and login again
```

### Powerlevel10k Not Loading

**Problem**: Prompt looks wrong

**Solutions**:

1. **Check installation:**
   ```bash
   ls ~/.powerlevel10k/
   ```

2. **Check .zshrc:**
   ```bash
   grep "powerlevel10k" ~/.zshrc
   ```

3. **Reconfigure:**
   ```bash
   p10k configure
   ```

---

## 🔍 General Debugging

### Check System Logs

```bash
# System journal
journalctl -xe

# X server logs
cat ~/.xsession-errors

# Specific application
journalctl -u display-manager
```

### Check Running Processes

```bash
# Check if components are running
ps aux | grep bspwm
ps aux | grep polybar
ps aux | grep picom
ps aux | grep sxhkd
```

### Reset Configuration

```bash
# Backup current config
mv ~/.config/bspwm ~/.config/bspwm.bak

# Reinstall
cd ~/dotfiles-arch
./install.sh
# Choose option [4]
```

---

## 🆘 Getting Help

### Before Asking for Help

1. **Check logs** for error messages
2. **Search** existing issues on GitHub
3. **Try** solutions in this guide
4. **Test** with default configurations

### Where to Get Help

- **GitHub Issues**: Open an issue with details
- **Arch Wiki**: https://wiki.archlinux.org
- **r/archlinux**: Reddit community
- **r/unixporn**: For ricing help
- **bspwm IRC**: #bspwm on Libera.Chat

### Information to Include

When asking for help, provide:
- Error messages (full output)
- System information (`neofetch`)
- Steps to reproduce
- What you've already tried
- Relevant configuration files

---

## 📚 Additional Resources

- [Arch Wiki](https://wiki.archlinux.org/)
- [bspwm GitHub](https://github.com/baskerville/bspwm)
- [Polybar Wiki](https://github.com/polybar/polybar/wiki)
- [r/archlinux](https://reddit.com/r/archlinux)

---

**Still having issues?** Open an issue on GitHub with detailed information!
