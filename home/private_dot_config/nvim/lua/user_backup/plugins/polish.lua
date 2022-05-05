return {
  require("luasnip.loaders.from_vscode").lazy_load({ paths = "/home/extra/.config/nvim-data/snippets", })

  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap
  local unmap = vim.api.nvim_del_keymap

  vim.opt.colorcolumn = "80,100,9999"
  vim.opt.scrolloff = 15
  vim.opt.sidescrolloff = 15

  vim.opt.numberwidth = 4

  vim.opt.undofile = false

  vim.opt.timeoutlen = 1000 -- I am slow at typing:-/
  vim.opt.clipboard = "" -- the default is *SLOW* on my system

  -- Undo some AstroVim mappings:
  unmap("n", "<C-q>")
  unmap("n", "<C-s>")
  unmap("n", "<leader>gd")

  map("n", "fm", ":lua vim.lsp.buf.formatting()<cr>", opts)
  map("n", "<leader>D", ":Telescope lsp_type_definitions<cr>", opts)

  -- Telescope mappings:
  map("n", "<leader>faf", ":Telescope find_files hidden=true no_ignore=true<cr>", opts)

  map("n", "<leader>fS", ":Telescope lsp_workspace_symbols<cr>", opts)
  map("n", "<leader>fs", ":Telescope lsp_document_symbols<cr>", opts)
  -- map("n", "<leader>fq", ":Telescope quickfix<cr>", opts)
  map("n", "<leader>fr", ":Telescope lsp_references<cr>", opts)
  map("n", "<leader>fs", ":Telescope lsp_document_symbols<cr>", opts)
  map("n", "<leader>fS", ":Telescope lsp_workspace_symbols<cr>", opts)

  map("n", "<leader>fgi", ":Telescope gh issues<cr>", opts)
  map("n", "<leader>fgp", ":Telescope gh pull_request<cr>", opts)
  map("n", "<leader>fgg", ":Telescope gh gist<cr>", opts)

  map("n", "<leader>fB", ":Telescope file_browser<cr>", opts)

  -- Crates mappings:
  map("n", "<leader>Ct", ":lua require('crates').toggle()<cr>", opts)
  map("n", "<leader>Cr", ":lua require('crates').reload()<cr>", opts)
  map("n", "<leader>CU", ":lua require('crates').upgrade_crate()<cr>", opts)
  map("v", "<leader>CU", ":lua require('crates').upgrade_crates()<cr>", opts)
  map("n", "<leader>CA", ":lua require('crates').upgrade_all_crates()<cr>", opts)

  -- DAP mappings:
  map("n", "<F5>", ":lua require('dap').continue()<cr>", opts)
  map("n", "<F10>", ":lua require('dap').step_over()<cr>", opts)
  map("n", "<F11>", ":lua require('dap').step_into()<cr>", opts)
  map("n", "<F12>", ":lua require('dap').step_out()<cr>", opts)
  map("n", "<leader>bp", ":lua require('dap').toggle_breakpoint()<cr>", opts)
  map("n", "<leader>Bp", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
  map("n", "<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: '))<cr>", opts)
  map("n", "<leader>rp", ":lua require('dap').repl.open()<cr>", opts)
  map("n", "<leader>RR", ":lua require('dap').run_last()<cr>", opts)
  map("n", "<leader>XX", ":lua require('dap').terminate()<cr>", opts)
  map("n", "<leader>du", ":lua require('dap').up()<cr>", opts)
  map("n", "<leader>dd", ":lua require('dap').down()<cr>", opts)

  -- Allow gf to work for non-existing files
  map("n", "gf", ":edit <cfile><cr>", opts)
  map("v", "gf", ":edit <cfile><cr>", opts)
  map("o", "gf", ":edit <cfile><cr>", opts)

  map("n", "<f8>", ":cprev<cr>", opts)
  map("n", "<f9>", ":cnext<cr>", opts)

  -- Syntax Tree Surfer

  -- Normal Mode Swapping
  map("n", "vd", '<cmd>lua require("syntax-tree-surfer").move("n", false)<cr>', opts)
  map("n", "vu", '<cmd>lua require("syntax-tree-surfer").move("n", true)<cr>', opts)
  -- .select() will show you what you will be swapping with .move(), you'll get used to .select() and .move() behavior quite soon!
  map("n", "vx", '<cmd>lua require("syntax-tree-surfer").select()<cr>', opts)
  -- .select_current_node() will select the current node at your cursor
  map("n", "vn", '<cmd>lua require("syntax-tree-surfer").select_current_node()<cr>', opts)

  -- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
  map("x", "J", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>', opts)
  map("x", "K", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>', opts)
  map("x", "H", '<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>', opts)
  map("x", "L", '<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>', opts)

  -- SWAPPING WITH VISUAL SELECTION: Only change the keymap to your liking. Don't change the .surf() parameters!
  map("x", "<A-j>", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', opts)
  map("x", "<A-k>", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', opts)

  -- Beacon
  map("n", "n", "n:Beacon<cr>", opts)
  map("n", "N", "N:Beacon<cr>", opts)
  map("n", "*", "*:Beacon<cr>", opts)
  map("n", "#", "#:Beacon<cr>", opts)
}