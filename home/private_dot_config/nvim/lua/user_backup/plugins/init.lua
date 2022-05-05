return {
  -- Extended file type support
  { "sheerun/vim-polyglot" },
  -- Cursor Jump Highlight
  {
    "rainbowhxch/beacon.nvim",
    config = function()
      require('beacon').setup({
        size = 160,
        minimal_jump = 5,
      })
    end,
  },

  -- LSP
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  -- Properly paste code into vim:
  { "ConradIrwin/vim-bracketed-paste" },

  -- My slint plugin
  { "slint-ui/vim-slint" },

  -- DAP:
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "nvim-dap", "rust-tools.nvim" },
    config = function()
      local dapui = require "dapui"
      dapui.setup {}

      local dap = require "dap"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "Pocco81/dap-buddy.nvim",
    config = function()
      -- require("dap-buddy").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
  },
  -- Rust support
  {
    "simrat39/rust-tools.nvim",
    requires = { "nvim-lspconfig", "nvim-lsp-installer", "nvim-dap", "Comment.nvim", "plenary.nvim" },
    -- Is configured via the server_registration_override installed below!
    config = function()
      local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension"
      local codelldb_path = extension_path .. "/adapter/codelldb"
      local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

      require("rust-tools").setup {
        server = server_opts,
        -- dap = {
        --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        -- },
        tools = {
          inlay_hints = {
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
        },
      }
    end,
  },
  {
    "Saecki/crates.nvim",
    after = "nvim-cmp",
    config = function()
      require("crates").setup()

      local cmp = require "cmp"
      local config = cmp.get_config()
      table.insert(config.sources, { name = "crates", priority=1100 })
      cmp.setup(config)
    end,
  },
  {
    "hrsh7th/cmp-calc",
    after = "nvim-cmp",
    config = function()
      require("crates").setup()

      local cmp = require "cmp"
      local config = cmp.get_config()
      table.insert(config.sources, { name = "calc", priority=100 })
      cmp.setup(config)
    end,
  },

  -- Tools
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },

  {
    "ggandor/lightspeed.nvim",
    config = function()
      require("lightspeed").setup {}
    end,
  },

  -- Text objects
  { "bkad/CamelCaseMotion" },
  {
    "ziontee113/syntax-tree-surfer",
    after = "nvim-treesitter",
  },

  -- Github:
  {
    'pwntester/octo.nvim',
    after = { 'telescope.nvim', },
    config = function ()
      require"octo".setup()
    end
  },

  {
    "nyngwang/NeoRoot.lua",
    cmd = "NeoRoot",
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    module = "nvim-window",
    config = function()
      require("nvim-window").setup {
        normal_hl = "WinJumpColor",
        hint_hl = "Bold",
        border = "none",
      }
    end,
  },
  {
    "ur4ltz/surround.nvim",
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    cmd = {
      "HopChar1CurrentLine",
      "HopChar2",
    },
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "beauwilliams/focus.nvim",
    cmd = {
      "FocusSplitNicely",
      "FocusToggle",
      "FocusSplitRight",
      "FocusSplitLeft",
      "FocusSplitBottom",
      "FocusSplitTop",
      "FocusSplitMaximise",
      "FocusSplitEqualise",
    },
    config = function()
      require("focus").setup {
        excluded_filetypes = { "toggleterm", "Mundo", "TelescopePrompt", "MundoDiff" },
        compatible_filetreess = { "neotree" },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "KabbAmine/vCoolor.vim",
    cmd = "VCoolor",
  },
  {
    "mfussenegger/nvim-dap",
    module = "dap",
    config = require "user.plugins.nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    config = require "user.plugins.nvim-dapui",
  },
  {
    "sindrets/winshift.nvim",
    cmd = "WinShift",
    config = require "user.plugins.WinShift",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    module = "telescope._extensions.dap",
    config = function()
      require("telescope").load_extension "dap"
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    module = "telescope._extensions.luasnip",
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },
  {
    "nvim-telescope/telescope-packer.nvim",
    module = "telescope._extensions.packer",
    config = function()
      require("telescope").load_extension "packer"
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    module = "telescope._extensions.zoxide",
    config = function()
      require("telescope").load_extension "zoxide"
    end,
  },
  {
    "rmagatti/auto-session",
    cmd = "SaveSession",
    config = function()
      vim.g.auto_session_enabled = false
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    end,
  },
  {
    "rmagatti/session-lens",
    cmd = "SearchSession",
    config = function()
      require("session-lens").setup {
        path_display = { "shorten" },
        previewer = true,
      }
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    module = "telescope._extensions.project",
    config = function()
      require("telescope").load_extension "project"
    end,
  },
}
