# Zellij

Zellij uses KDL and reads this file as `~/.config/zellij/config.kdl`.
The checked-in file is managed by chezmoi.

The configuration uses Ctrl+A to toggle between locked mode (normal input
passes through) and normal mode (Zellij controls). From normal mode, choose
pane (`p`), tab (`t`), resize (`r`), or session (`s`) mode. The mode bar
shows the active mode and available shortcuts.

## Familiar shortcuts

- `Ctrl+A p h/j/k/l`: focus a pane
- `Ctrl+A p |` / `Ctrl+A p -`: split right / down
- `Ctrl+A r H/J/K/L`: resize a pane
- `Ctrl+A t c`: create a tab
- `Ctrl+A t h/l`: previous / next tab
- `Ctrl+A s w`: open the session manager
- `Ctrl+A s d`: detach from the session
- `Ctrl+A m`: toggle mouse support
- `Ctrl+A Ctrl+A` or `Esc`: return to locked mode

Zellij is modal, so most actions use a mode key plus the action key. Pane
navigation and resizing remain in their modes for repeated movement; split and
new-tab actions return to locked mode.

Session layout and up to 10,000 lines of scrollback are serialized for
resurrection. Zellij asks before rerunning restored commands.

## Try it

Install or update managed files without immediately applying them:

```sh
chezmoi update --apply=false
```

Review the proposed change, then apply it:

```sh
chezmoi apply ~/.config/zellij/config.kdl
```

Start Zellij with `zellij`, or reload the config in an active session with
`Ctrl+A` followed by `r` only if normal-mode `r` is assigned as resize mode
(and use the Zellij configuration screen/reload action instead). Config changes
are watched automatically by Zellij.
