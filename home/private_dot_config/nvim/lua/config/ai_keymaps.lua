-- lua/config/ai_keymaps.lua

local map = vim.keymap.set
local function opts(desc)
  return { noremap = true, silent = true, desc = "AI: " .. desc }
end

-- === Claude Code primary entry points ===

-- Toggle/focus Claude Code terminal (like Cursor's chat/sidebar)
map("n", "<leader>ac", "<cmd>ClaudeCodeFocus<cr>", opts("Claude Code (focus/toggle)"))
-- Extra toggle if you like (optional, matches :ClaudeCode)
map("n", "<leader>cc", "<cmd>ClaudeCode<cr>", opts("Claude Code (toggle)"))

-- Send visual selection to Claude as context
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", opts("Send selection to Claude Code"))

-- Resume last conversation
map("n", "<leader>aC", "<cmd>ClaudeCodeContinue<cr>", opts("Continue last Claude conversation"))

-- Verbose Claude session
map("n", "<leader>aV", "<cmd>ClaudeCodeVerbose<cr>", opts("Claude Code (verbose)"))

-- Accept/deny diffs when Claude proposes changes
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", opts("Accept Claude diff"))
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", opts("Reject Claude diff"))
