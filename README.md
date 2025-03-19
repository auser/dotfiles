# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), focusing on simplicity and clean organization.

## Installation

### Quick Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply auser
```

### Manual Install

1. Install chezmoi:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. Initialize with this repo:
   ```bash
   chezmoi init auser
   ```

3. Apply changes:
   ```bash
   chezmoi apply
   ```

## What's Included

- **Zsh configuration**: Lightweight setup without Oh My Zsh dependency, with git-aware prompt
- **Tmux configuration**: Simplified with intuitive key bindings and sensible defaults
- **Vim setup**: Clean configuration with essential features
- **Git configuration**: Standard settings with useful aliases
- **Shell aliases**: Common shortcuts for everyday commands

## Philosophy

These dotfiles are designed with simplicity and maintainability in mind:

- **Minimal dependencies**: No reliance on external frameworks like Oh My Zsh
- **Straightforward configuration**: Clear organization and comments
- **Easy customization**: Support for local overrides through .local files
- **Cross-platform compatibility**: Works on macOS, Linux, and other Unix-like systems

## Organization

The repository is organized by target locations in the home directory, managed through Chezmoi's templating and configuration system.

## 1Password Integration

This dotfiles setup optionally integrates with 1Password to securely store and retrieve sensitive information:

1. **Prerequisites**:
   - 1Password CLI (`op`) installed
   - Logged in to your 1Password account (`op signin`)

2. **Stored Secrets**:
   - GitHub API tokens
   - Homebrew tokens (macOS only)
   - Other personal credentials can be easily added

3. **How it works**:
   - On first run, you'll be asked if this is a personal machine
   - If yes, and if 1Password CLI is detected, credentials will be used
   - If 1Password is not available, the configuration degrades gracefully

4. **Troubleshooting**:
   - If you see errors related to 1Password, ensure you're logged in: `op signin`
   - You can manually edit `.chezmoi.toml` to adjust 1Password settings

## Customization

Each configuration file supports local customizations:

- `~/.zshrc.local`: Custom zsh settings
- `~/.tmux.conf.local`: Custom tmux settings
- `~/.vimrc.local`: Custom vim settings
- `~/.gitconfig.local`: Custom git settings 