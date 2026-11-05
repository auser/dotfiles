# Zellij

Zellij uses KDL and reads this file as `~/.config/zellij/config.kdl`.
The checked-in configuration is managed by chezmoi.

This setup keeps a tmux-style prefix workflow: press Ctrl+A, then one action
key. Zellij returns to locked mode after each action, so normal terminal
shortcuts (including Ctrl+A in shells and editors) pass through. Press Ctrl+A
twice to send Ctrl+A to the application.

## Shortcuts

| Keys | Action |
| --- | --- |
| Ctrl+A, h/j/k/l | Focus left/down/up/right pane |
| Ctrl+A, `\` | Vertical split (panes side by side) |
| Ctrl+A, `-` | Horizontal split (panes stacked) |
| Ctrl+A, a | Open a new pane in the largest available area |
| Ctrl+A, Ctrl+N | New tab |
| Ctrl+A, Ctrl+Z | Toggle focused pane zoom |
| Ctrl+A, H/J/K/L | Resize left/down/up/right |
| Ctrl+A, r, H/J/K/L | Resize a pane |
| Ctrl+A, c | New tab (alternate shortcut) |
| Ctrl+A, p / n | Previous / next tab |
| Ctrl+A, , | Rename pane |
| Ctrl+A, . | Rename tab |
| Ctrl+A, Ctrl+X | Close focused pane |
| Ctrl+A, s | Open session manager |
| Ctrl+A, d | Detach |
| Ctrl+A, [ | Enter scrollback |
| Ctrl+A, m | Toggle mouse mode |

Pane focus, splits, tab navigation, new pane, zoom and closing a pane use the
prefix plus one key. Resizing uses Ctrl+A then `r` to enter resize mode,
followed by H/J/K/L; each resize returns to locked mode. Scrollback supports
Page Up/Down, Enter to search, and `e` to edit in Neovim.

Session layout and up to 10,000 lines of scrollback are serialized for
resurrection. Zellij asks before rerunning restored commands.

## Apply with chezmoi

Preview the managed changes, then apply the Zellij config:

```sh
chezmoi diff
chezmoi apply ~/.config/zellij/config.kdl
```

Zellij watches its configuration file and applies most changes to active
sessions automatically. Start it with `zellij`.
