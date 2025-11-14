-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local map = vim.keymap.set

-- Open terminal in horizontal split
map("n", "<A-Enter>", function()
  vim.cmd("sp")
  vim.cmd("terminal")
end, { desc = "Open terminal (split)" })

-- Open terminal in vertical split
map("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, { desc = "Open terminal (vertical)" })

-- Better escape from terminal mode
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Close any terminal (floating or split)
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map({ "n", "t" }, "<leader>x", function()
  vim.cmd("close")
end, { desc = "Close terminal window" })

-- Testing
