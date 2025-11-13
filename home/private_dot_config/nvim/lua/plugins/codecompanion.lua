return {
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
      },
      config = function()
        local adapters = require("codecompanion.adapters")
  
        require("codecompanion").setup({
          -- Use Anthropic as the main provider
          adapters = {
            anthropic = function()
              return adapters.extend("anthropic", {
                env = {
                  -- plugin reads this env var
                  api_key = "ANTHROPIC_API_KEY",
                },
                -- you can override defaults here if you want
                -- opts = { model = "claude-3-5-sonnet-20241022" },
              })
            end,
          },
  
          -- Make Anthropic the default for chat + inline
          strategies = {
            chat = {
              adapter = "anthropic",
            },
            inline = {
              adapter = "anthropic",
            },
          },
  
          -- Minimal display tweaks (optional)
          display = {
            chat = {
              window = {
                layout = "vertical", -- feels a bit more Cursor/Zed-like
                width = 0.45,
              },
            },
          },
        })
      end,
    },
  }
  