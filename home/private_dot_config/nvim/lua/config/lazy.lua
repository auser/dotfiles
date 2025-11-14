local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  spec = {
    -- Load LazyVim + its defaults
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Load all user plugins from lua/plugins/*.lua
    { import = "plugins" },
  },

  defaults = {
    lazy = false,
    version = false,
  },

  install = {
    colorscheme = { "catppuccin", "tokyonight" },
  },

  checker = { enabled = true, notify = false },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "netrwPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
