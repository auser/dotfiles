# Herdr

Herdr reads this config from `~/.config/herdr/config.toml`. The checked-in
file is managed by chezmoi.

The keymap uses Ctrl+A as a tmux-style prefix and follows the tmux bindings
in `home/dot_tmux.conf` where Herdr has an equivalent action. Herdr's
`prefix+?` opens a searchable list of active shortcuts.

## Shortcuts

| Keys | Action |
| --- | --- |
| Ctrl+A, h/j/k/l | Focus left/down/up/right pane |
| Ctrl+A, Ctrl+\| | Split vertically (side by side) |
| Ctrl+A, Ctrl+- | Split horizontally (stacked) |
| Ctrl+A, Ctrl+N or c | New tab |
| Ctrl+A, Ctrl+H / Ctrl+L | Previous / next tab |
| Ctrl+A, p / n | Previous / next tab (alternate) |
| Ctrl+A, 1–9 | Jump to tab |
| Ctrl+A, Ctrl+Z or z | Zoom focused pane |
| Ctrl+A, r | Enter resize mode |
| Ctrl+A, Ctrl+X or x | Close focused pane |
| Ctrl+A, [ | Copy mode |
| Ctrl+A, , | Rename pane |
| Ctrl+A, . | Rename tab |
| Ctrl+A, s | Open Herdr's session navigator |
| Ctrl+A, w | Open workspace picker |
| Ctrl+A, d | Detach |
| Ctrl+A, Shift+R | Reload config |
| Ctrl+A, ? | Search keybindings |

New panes and tabs follow the active pane's working directory. Herdr keeps pane
processes alive across detach and can restore sessions after a full restart.

## Close confirmation

Herdr asks before closing a workspace's only pane or its last tab. Closing an
ordinary split pane is immediate, including through the close shortcut. The
config enables Herdr's built-in confirmation, but Herdr does not currently
provide a setting to prompt before every pane close.

## Apply with chezmoi

```sh
chezmoi diff
chezmoi apply ~/.config/herdr/config.toml
herdr server reload-config
```

The reload shortcut is Ctrl+A, then Shift+R. It can also be applied with
`herdr server reload-config`.
