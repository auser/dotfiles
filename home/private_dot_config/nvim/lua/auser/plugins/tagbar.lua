return {
	"preservim/tagbar",
	config = function()
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>tb", "<cmd>TagbarToggle<cr>", { desc = "Open tagbar" })
	end,
}
