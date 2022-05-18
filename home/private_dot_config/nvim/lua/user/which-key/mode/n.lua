return {
  ["<leader>"] = {
    ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
    ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
    ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },

    f = {
      name = "Telescope",
      ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
      F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
      p = { "<cmd>Telescope project<cr>", "Projects" },
    },

    m = {
      name = "Markdown",
      p = { ":MarkdownPreviewToggle<CR>", "Toggle Preview" },
    },
  },
}
