local opts = { noremap = true, silent = true }

-- resize with arrows
vim.keymap.set("n", "<Up>", function()
  require("smart-splits").resize_up(2)
end, { desc = "Resize split up" })
vim.keymap.set("n", "<Down>", function()
  require("smart-splits").resize_down(2)
end, { desc = "Resize split down" })
vim.keymap.set("n", "<Left>", function()
  require("smart-splits").resize_left(2)
end, { desc = "Resize split left" })
vim.keymap.set("n", "<Right>", function()
  require("smart-splits").resize_right(2)
end, { desc = "Resize split right" })
-- navigating wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
vim.keymap.set({ "n", "v" }, "k", "gk", { desc = "Navigate up" })
-- easy splits
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
-- better increment/decrement
vim.keymap.set("n", "-", "<c-x>", { desc = "Descrement number" })
vim.keymap.set("n", "+", "<c-a>", { desc = "Increment number" })
vim.keymap.set("x", "+", "g<c-a>", { desc = "Increment number" })
vim.keymap.set("x", "-", "g<c-x>", { desc = "Descrement number" })
-- line text-objects
vim.keymap.set("x", "il", "g_o^", { desc = "Inside line text object" })
vim.keymap.set("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
vim.keymap.set("x", "al", "$o^", { desc = "Around line text object" })
vim.keymap.set("o", "al", ":normal val<cr>", { desc = "Around line text object" })
-- more in/all objects between 2 characters
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    vim.keymap.set(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    vim.keymap.set(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end
-- type template string
vim.keymap.set("i", ";mk", "<++>", { desc = "Insert template string" })
vim.keymap.set("i", "<S-Tab>", "<C-V><Tab>", { desc = "Tab character" })
-- terminal mappings
vim.keymap.set("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quite" })
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal below window" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal above window" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window" })
-- cmp lsp auto complete
vim.keymap.set("i", "<c-x><c-o>", function()
  require("cmp").complete { config = { sources = { { name = "nvim_lsp" } } } }
end, { desc = "Complete LSP" })
vim.keymap.set("", "<c-e><c-e>", "<Plug>SendLine", { desc = "Send line to REPL" })
vim.keymap.set("", "<c-e>", "<Plug>Send", { desc = "Send to REPL" })
-- Treesitter Surfer
vim.keymap.set("x", "J", function()
  require("syntax-tree-surfer").surf("next", "visual")
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "K", function()
  require("syntax-tree-surfer").surf("prev", "visual")
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("x", "H", function()
  require("syntax-tree-surfer").surf("parent", "visual")
end, { desc = "Surf parent tree-sitter object" })
vim.keymap.set("x", "L", function()
  require("syntax-tree-surfer").surf("child", "visual")
end, { desc = "Surf child tree-sitter object" })
vim.keymap.set("x", "<c-j>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "<c-l>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "<c-k>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("x", "<c-h>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("n", "<c-down>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
vim.keymap.set("n", "<c-right>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
vim.keymap.set("n", "<c-up>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })
vim.keymap.set("n", "<c-left>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })

    -- Crates mappings:
vim.keymap.set("n", "<leader>Ct", ":lua require('crates').toggle()<cr>", opts)
vim.keymap.set("n", "<leader>Cr", ":lua require('crates').reload()<cr>", opts)
vim.keymap.set("n", "<leader>CU", ":lua require('crates').upgrade_crate()<cr>", opts)
vim.keymap.set("v", "<leader>CU", ":lua require('crates').upgrade_crates()<cr>", opts)
vim.keymap.set("n", "<leader>CA", ":lua require('crates').upgrade_all_crates()<cr>", opts)


