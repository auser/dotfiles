-- ====================================================================
--  CURSOR + VSCODE + CLAUDE + TERMINAL + BUFFER NAV KEYMAPS (UNIFIED)
-- ====================================================================

local map = vim.keymap.set
local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-----------------------------------------------------------------------
--  LEADER (SPACE)
-----------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------------------
--  FILE EXPLORER (Neo-tree)
-----------------------------------------------------------------------

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts("Explorer toggle"))
map("n", "<D-b>", "<cmd>Neotree toggle<cr>", opts("Explorer (Cmd+B)"))

-----------------------------------------------------------------------
--  FINDERS (Cursor / VS Code style)
-----------------------------------------------------------------------

map("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts("Find file"))
map("n", "<D-t>", "<cmd>Telescope find_files<cr>", opts("Find file (Cmd+T)"))
map("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", opts("Search workspace"))
map("n", "<C-S-o>", "<cmd>Telescope lsp_document_symbols<cr>", opts("Document symbols"))
map("n", "<leader>O", "<cmd>Telescope lsp_workspace_symbols<cr>", opts("Workspace symbols"))

-----------------------------------------------------------------------
--  LSP (Cursor-like)
-----------------------------------------------------------------------

map("n", "<F12>", vim.lsp.buf.definition, opts("LSP: Definition"))
map("n", "<S-F12>", vim.lsp.buf.references, opts("LSP: References"))
map("n", "<F2>", vim.lsp.buf.rename, opts("LSP: Rename"))
map("n", "<C-.>", vim.lsp.buf.code_action, opts("LSP: Code actions"))

-----------------------------------------------------------------------
--  BUFFERS & TABS (Cursor-like)
-----------------------------------------------------------------------

-- Next / previous buffer
map("n", "<Tab>", "<cmd>bnext<cr>", opts("Next buffer"))
map("n", "<S-Tab>", "<cmd>bprevious<cr>", opts("Previous buffer"))

-- Close buffer (Cmd+W like VS Code)
map("n", "<D-w>", "<cmd>bdelete<cr>", opts("Close buffer"))

-- Cmd + 1..9 to jump to tabs
for i = 1, 9 do
  map("n", "<D-" .. i .. ">", function()
    vim.cmd(i .. "tabnext")
  end, opts("Go to tab " .. i))
end

-----------------------------------------------------------------------
--  TERMINAL UX (Cursor-like)
-----------------------------------------------------------------------

-- Split terminals
map("n", "<A-Enter>", function()
  vim.cmd("sp | terminal")
end, opts("Terminal (horizontal split)"))

map("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, opts("Terminal (vertical split)"))

-- Escape terminal mode easily
map("t", "<Esc>", [[<C-\><C-n>]], opts("Exit terminal mode"))
map("t", "<Esc><Esc>", [[<C-\><C-n>]], opts("Exit terminal mode"))

-- Close terminal window
map({ "n", "t" }, "<leader>x", "<cmd>close<cr>", opts("Close window"))

-----------------------------------------------------------------------
--  CLAUDE CODE — MAIN AI TOOL (Recommended)
-----------------------------------------------------------------------

-- Toggle Claude Code (main entry)
map("n", "<leader>ac", "<cmd>ClaudeCodeFocus<cr>", opts("Claude: Focus/toggle"))

-- Default toggle as well
map("n", "<leader>cc", "<cmd>ClaudeCode<cr>", opts("Claude: Toggle"))

-- Send selection
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", opts("Claude: Send selection"))

-- Conversation controls
map("n", "<leader>aC", "<cmd>ClaudeCodeContinue<cr>", opts("Claude: Continue"))
map("n", "<leader>aV", "<cmd>ClaudeCodeVerbose<cr>", opts("Claude: Verbose"))

-- Diff acceptance / rejection
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", opts("Claude: Accept diff"))
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", opts("Claude: Reject diff"))

-----------------------------------------------------------------------
--  COMMENTS (Comment.nvim)
-----------------------------------------------------------------------

-- Line comment toggle: gcc
-- Block comment toggle: gbc
-- Visual mode:
--   gc = line comment
--   gb = block comment

-- (No extra mapping needed unless you want VS Code style)

-----------------------------------------------------------------------
--  OPTIONAL — REOPEN LAST CLOSED BUFFER (Cmd-Shift-T)
-----------------------------------------------------------------------

map("n", "<D-S-t>", function()
  vim.cmd("e #")
end, opts("Reopen last closed buffer"))

-----------------------------------------------------------------------
--  END UNIFIED KEYMAPS
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--  AVANTE — Cursor-like AI agent
-----------------------------------------------------------------------

local map = vim.keymap.set
local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Avante AI
local avante_api = function()
  return require("avante.api")
end

map({ "n", "v" }, "<leader>aa", function() avante_api().ask() end, opts("Avante: Ask"))
map({ "n", "v" }, "<leader>ae", function() avante_api().edit() end, opts("Avante: Edit"))
map("n", "<leader>ar", function() avante_api().refresh() end, opts("Avante: Refresh"))
