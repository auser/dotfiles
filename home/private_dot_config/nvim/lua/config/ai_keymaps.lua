-- lua/config/ai_keymaps.lua

local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = "AI: " .. desc }
end

-- === Primary AI entry points (Cursor-like) ===

-- Open/toggle chat side panel (like Cursor's chat sidebar)
map({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", opts("Chat (toggle)"))

-- Ask about selection / code under cursor (inline)
-- Visual mode: operate on selection; Normal: whole buffer + cursor context
map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanion<cr>", opts("Ask / Inline assistant"))

-- Open the "Action Palette" (Cursor-style quick actions)
map({ "n", "v" }, "<leader>ap", "<cmd>CodeCompanionActions<cr>", opts("Action palette"))

-- Add selection to current chat (like “Add to chat” in Cursor)
map("v", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", opts("Send selection to chat"))


-- === Common flows, Cursor-ish semantics ===

-- Explain selection
map("v", "<leader>ae", ":CodeCompanion /explain<cr>", opts("Explain selection"))

-- Refactor / improve selection
map("v", "<leader>ar", ":CodeCompanion /refactor<cr>", opts("Refactor selection"))

-- Fix diagnostics under cursor (when you have a prompt for that)
map("n", "<leader>af", ":CodeCompanion /fix_diagnostic<cr>", opts("Fix diagnostic"))

-- Document this file / function (if you add prompts)
map({ "n", "v" }, "<leader>ad", ":CodeCompanion /doc<cr>", opts("Generate docs"))
