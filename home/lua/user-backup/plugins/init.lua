return {
  -- Disable default plugins
  ["declancm/cinnamon.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  -- ["numToStr/Comment.nvim"] = { disable = false },

  -- Colorscheme/theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup(require "user.plugins.nightfox")
    end,
  },

  -- Font for icons
  ["yamatsum/nvim-nonicons"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- Annotation generator
  ["danymat/neogen"] = {
    module = "neogen",
    cmd = "Neogen",
    config = function()
      require("neogen").setup(require "user.plugins.neogen")
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  },

  -- Highlight, navigate, and operate on sets of matching text
  ["andymass/vim-matchup"] = {
    after = "nvim-treesitter",
  },

  -- Collection of minimal, independent, and fast Lua modules
  ["echasnovski/mini.nvim"] = {
    event = "VimEnter",
    config = function()
      require "user.plugins.mini"()
    end,
  },

  -- Markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"](0)
    end,
    ft = {
      "markdown",
    },
  },

  -- Reopen files at last edit position
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
    end,
  },

  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },

  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "emoji"
    end,
  },

  -- Highlights for text filetypes, like markdown
  ["lukas-reineke/headlines.nvim"] = {
    ft = { "markdown", "rmd" },
    config = function()
      require("headlines").setup(require "user.plugins.headlines")
    end,
  },

  -- plain text note-taking assistant
  ["mickael-menu/zk-nvim"] = {
    module = { "zk", "zk.commands" },
    config = function()
      require("zk").setup(require "user.plugins.zk")
    end,
  },

  ["nanotee/sqls.nvim"] = { module = "sqls" },

  ["jparise/vim-graphql"] = {},
  ["pantharshit00/vim-prisma"] = {},

  ["phaazon/hop.nvim"] = {
    branch = "v1",
    cmd = {
      "HopChar1CurrentLine",
      "HopChar2",
    },
    config = function()
      require("hop").setup()
    end,
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },

  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.hop",
    config = function()
      require("telescope").load_extension "hop"
    end,
  },

  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.project",
    config = function()
      require("telescope").load_extension "project"
    end,
  },

  ["benfowler/telescope-luasnip.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip",
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },

  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },

  ["klen/nvim-test"] = {
    cmd = {
      "TestSuite",
      "TestFile",
      "TestNearest",
      "TestLast",
      "TestVisit",
      "TestEdit",
    },
    config = function()
      require("nvim-test").setup(require "user.plugins.nvim-test")
    end,
  },

  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require("git-conflict").setup(require "user.plugins.git-conflict")
    end,
  },
}
