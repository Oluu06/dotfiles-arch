# Contributing to Arch Linux Dotfiles

Thank you for considering contributing to this project! 🎉

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- System information (neofetch output)
- Relevant logs or error messages

### Suggesting Features

Feature requests are welcome! Please:
- Check if the feature already exists
- Describe the feature in detail
- Explain why it would be useful
- Provide examples if possible

### Pull Requests

1. **Fork the repository**
2. **Create a branch** for your feature:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes**
4. **Test thoroughly**
5. **Commit with clear messages**:
   ```bash
   git commit -m "Add: amazing feature"
   ```
6. **Push to your fork**:
   ```bash
   git push origin feature/amazing-feature
   ```
7. **Open a Pull Request**

### Code Style

- Use **bash** for scripts
- Follow existing code style
- Add comments for complex logic
- Use meaningful variable names
- Test on fresh Arch Linux installation

### Commit Messages

Use clear, descriptive commit messages:
- `Add: new feature`
- `Fix: bug in script`
- `Update: documentation`
- `Refactor: code cleanup`
- `Style: formatting changes`

## Development Setup

```bash
# Clone your fork
git clone https://github.com/yourusername/dotfiles-arch.git
cd dotfiles-arch

# Create a branch
git checkout -b feature/my-feature

# Make changes and test
./install.sh

# Commit and push
git add .
git commit -m "Add: my feature"
git push origin feature/my-feature
```

## Testing

Before submitting:
- Test on clean Arch Linux installation
- Test all affected scripts
- Verify documentation is updated
- Check for typos and formatting

## Documentation

When adding features:
- Update README.md if needed
- Update relevant docs in docs/
- Add comments to code
- Include examples

## Questions?

Feel free to open an issue for any questions!

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing! 🙏
