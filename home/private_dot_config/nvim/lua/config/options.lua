-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- existing comments...

-- Don't break out of zoomed tmux pane when navigating
vim.g.tmux_navigator_disable_when_zoomed = 1

-- Save all buffers when jumping from Neovim → tmux (optional)
vim.g.tmux_navigator_save_on_switch = 2

-- Don't wrap around screen edges (optional)
-- vim.g.tmux_navigator_no_wrap = 1
