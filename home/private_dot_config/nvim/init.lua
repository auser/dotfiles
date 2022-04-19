pcall(require, "impatient")
-- require'impatient'.enable_profile()

if require("auser.first_load")() then
  return
end

-- Leader Key
vim.g.mapleader = " "

require("auser.globals")
require("auser.lsp")
require("auser.telescope").setup()
require("auser.statusline").setup()
