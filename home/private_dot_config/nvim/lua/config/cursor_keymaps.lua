-- lua/config/cursor_keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === File tree (like VS Code's Explorer) ===
-- Assuming neo-tree or nvim-tree; adjust command as needed.

-- LazyVim uses Neo-tree by default:
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", vim.tbl_extend("force", opts, { desc = "Explorer (toggle)" }))

-- For nvim-tree instead:
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", vim.tbl_extend("force", opts, { desc = "Explorer (toggle)" }))


-- === Find files / symbols / grep (Cursor + VS Code analogues) ===

-- Ctrl+P → quick open file
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", vim.tbl_extend("force", opts, { desc = "Find file" }))

-- Ctrl+Shift+F → search in workspace
map("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", opts, { desc = "Search in workspace" }))

-- Go to symbol in file (Ctrl+Shift+O)
map("n", "<C-S-o>", "<cmd>Telescope lsp_document_symbols<cr>", vim.tbl_extend("force", opts, { desc = "File symbols" }))

-- Go to symbol in workspace
map("n", "<leader>O", "<cmd>Telescope lsp_workspace_symbols<cr>", vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))


-- === LSP-ish things mapped to familiar keys ===

-- F12: go to definition
map("n", "<F12>", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))

-- Shift+F12: references
map("n", "<S-F12>", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "List references" }))

-- F2: rename symbol
map("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

-- Ctrl+.: quick actions (VS Code style)
map("n", "<C-.>", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))


-- === Buffers & tabs (Cursor-like tab behavior) ===

-- Ctrl+Tab / Ctrl+Shift+Tab to cycle buffers
map("n", "<C-Tab>", "<cmd>bnext<cr>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))

-- Close buffer (like Cmd+W / Ctrl+W in editors)
map("n", "<leader>bd", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Close buffer" }))


-- === Quality-of-life ===

-- Better escape for terminals (Cursor-style "pop out")
map("t", "<Esc><Esc>", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
