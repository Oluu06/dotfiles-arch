# 🎯 Setup Instructions for GitHub

Follow these steps to prepare your dotfiles for GitHub.

---

## 📋 Pre-Upload Checklist

### 1. Make Scripts Executable

```bash
cd dotfiles-arch
chmod +x make-executable.sh
./make-executable.sh
```

This ensures all scripts have proper execution permissions in Git.

### 2. Add Wallpapers (Optional)

Add your favorite wallpapers to theme directories:

```bash
# Add wallpapers for each theme
cp your-wallpaper.jpg themes/catppuccin-mocha/wallpapers/default.jpg
cp your-wallpaper.jpg themes/nord/wallpapers/default.jpg
cp your-wallpaper.jpg themes/tokyo-night/wallpapers/default.jpg
```

**Note**: Keep wallpapers under 5MB for faster cloning.

### 3. Add Screenshots

Create a `screenshots/` directory and add images:

```bash
mkdir screenshots
# Add your screenshots here
```

Then update README.md with actual screenshot links.

### 4. Update Repository URL

Replace placeholder URLs in:
- `README.md`
- `docs/INSTALLATION.md`
- `docs/QUICK_START.md`

Change:
```
https://github.com/yourusername/dotfiles-arch.git
```

To your actual repository URL.

---

## 🚀 Initialize Git Repository

```bash
cd dotfiles-arch

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Complete Arch Linux dotfiles with bspwm"

# Add remote (replace with your URL)
git remote add origin https://github.com/yourusername/dotfiles-arch.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

## 📝 Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `dotfiles-arch`
3. Description: `Modern Arch Linux dotfiles with bspwm, polybar, and Catppuccin theme`
4. Public repository
5. **Don't** initialize with README (we already have one)
6. Create repository

---

## 🏷️ Add Topics (Tags)

On GitHub, add these topics to your repository:
- `dotfiles`
- `arch-linux`
- `bspwm`
- `polybar`
- `catppuccin`
- `ricing`
- `linux`
- `window-manager`
- `picom`
- `rofi`
- `unix`
- `customization`

---

## 📸 Add Screenshots

### Taking Screenshots

After installation:

```bash
# Take full desktop screenshot
flameshot full -p ~/Pictures/Screenshots/

# Or use screenshot script
screenshot full
```

### Recommended Screenshots

1. **Clean desktop** - Empty workspace with polybar
2. **Terminal** - Kitty with neofetch
3. **Rofi launcher** - Application menu open
4. **File manager** - Thunar or ranger
5. **System monitor** - btop running
6. **Multiple workspaces** - Show workspace switching

### Upload to GitHub

```bash
# Add screenshots
git add screenshots/
git commit -m "Add screenshots"
git push
```

Update README.md:
```markdown
## 📸 Screenshots

![Desktop](screenshots/desktop.png)
![Terminal](screenshots/terminal.png)
![Rofi](screenshots/rofi.png)
```

---

## 🎨 Optional Enhancements

### Add Badges

Update README.md with more badges:

```markdown
![GitHub stars](https://img.shields.io/github/stars/yourusername/dotfiles-arch?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/yourusername/dotfiles-arch?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/yourusername/dotfiles-arch?style=for-the-badge)
```

### Create GitHub Pages

Enable GitHub Pages in repository settings to host documentation.

### Add GitHub Actions

Create `.github/workflows/verify.yml` for automated testing:

```yaml
name: Verify Scripts
on: [push, pull_request]
jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Check script syntax
        run: |
          find . -name "*.sh" -exec bash -n {} \;
```

---

## 📢 Share Your Rice

### Post on Reddit

Share on:
- r/unixporn
- r/archlinux
- r/linux

### Template Post

```
[bspwm] My first Arch Linux rice with Catppuccin Mocha

**Details:**
- WM: bspwm
- Bar: Polybar
- Compositor: picom-pijulius-git
- Terminal: kitty
- Theme: Catppuccin Mocha
- Dotfiles: [link to your repo]

**Features:**
- Smooth animations
- Blur effects
- Theme switcher
- Complete documentation
```

---

## 🔄 Keeping Updated

### Update Your Dotfiles

```bash
# Make changes
git add .
git commit -m "Update: description of changes"
git push
```

### Version Tags

Create version tags:

```bash
git tag -a v1.0.0 -m "Initial release"
git push origin v1.0.0
```

---

## 🤝 Enable Discussions

In GitHub repository settings:
1. Go to "Features"
2. Enable "Discussions"
3. Create categories:
   - General
   - Q&A
   - Show and Tell
   - Ideas

---

## 📊 Add Repository Stats

Create a `STATS.md` file:

```markdown
# Repository Statistics

- **Total Files**: X
- **Lines of Code**: X
- **Configuration Files**: X
- **Scripts**: X
- **Themes**: 3
- **Documentation Pages**: 7
```

---

## ✅ Final Verification

Before making repository public:

- [ ] All scripts are executable
- [ ] README has screenshots
- [ ] Repository URL is updated everywhere
- [ ] LICENSE file is present
- [ ] .gitignore is configured
- [ ] Documentation is complete
- [ ] No sensitive information (API keys, passwords)
- [ ] All links work
- [ ] Scripts have been tested

---

## 🎉 You're Ready!

Your dotfiles are now ready to be shared with the world!

### Next Steps

1. **Star your own repo** (for good luck 😄)
2. **Share on social media**
3. **Join the community**
4. **Keep improving**

---

## 📚 Resources

- [GitHub Docs](https://docs.github.com)
- [r/unixporn Wiki](https://www.reddit.com/r/unixporn/wiki/index)
- [Arch Wiki](https://wiki.archlinux.org)

---

**Good luck with your dotfiles!** 🚀

If you need help, check the documentation or open an issue.
