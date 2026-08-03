# Dotfiles

Personal macOS and Linux configuration managed with [chezmoi](https://www.chezmoi.io/).

## Installation

### Quick install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply auser
```

### Manual install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
chezmoi init auser
chezmoi apply
```

## What is managed

- **Zsh**: Oh My Zsh, Powerlevel10k, completions, guarded tool integrations, and host-local overrides
- **Tmux**: tmux configuration and TPM-managed plugins
- **Editors**: Vim/Neovim and Zed settings
- **Git and CLI tools**: shared configuration, aliases, and platform-specific packages
- **macOS and Linux**: chezmoi templates and platform-specific install scripts

Oh My Zsh, Powerlevel10k, and selected zsh plugins are installed through chezmoi externals. Shell startup is intentionally ordered so that Homebrew and completion paths are available before Oh My Zsh runs `compinit`, and Oh My Zsh is sourced only once.

## Zsh organization

- `home/dot_zprofile.tmpl`: quiet login-shell environment, primarily Homebrew
- `home/dot_zshrc.tmpl`: interactive shell bootstrap, prompt, history, aliases, and module loading
- `home/private_dot_config/zsh/env.zsh`: static environment variables and small helper functions
- `home/private_dot_config/zsh/features/*.zsh`: optional, guarded tool integrations loaded in lexical order
- `home/dot_p10k.zsh`: generated Powerlevel10k configuration
- `~/.zshrc.local`: unmanaged machine-local overrides

Feature modules must not source Oh My Zsh, initialize completion, or duplicate global PATH setup. Optional tools should be checked before they are invoked, and startup files should not write to the console.

## Restoring shell dependencies

After an interrupted install or manual replacement of `~/.oh-my-zsh`, restore chezmoi-managed externals and rebuild the completion cache:

```bash
chezmoi apply
rm -f ~/.zcompdump*
exec zsh
```

A `compinit: no such file or directory` message usually means that a completion file or symlink inside a directory in `$fpath` is stale. Remove or restore that specific entry before rebuilding `.zcompdump`.

## 1Password integration

On personal machines, the zsh template can use the 1Password CLI for GitHub and Homebrew API tokens.

Prerequisites:

- 1Password CLI (`op`)
- A configured account in chezmoi data
- An authenticated 1Password session when secret-backed commands are needed

The configuration degrades when `op` is unavailable.

## Local customization

These files are intentionally unmanaged and can hold machine-specific settings:

- `~/.zshrc.local`
- `~/.tmux.conf.local`
- `~/.vimrc.local`
- `~/.gitconfig.local`
