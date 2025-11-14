-- Set leader keys BEFORE loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load bootstrap + plugins
require("config.lazy")

-- Load your keymaps (optional split file)
require("config.keymaps")
