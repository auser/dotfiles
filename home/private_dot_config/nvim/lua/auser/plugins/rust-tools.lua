return {
	"simrat39/rust-tools.nvim",
	server = {
		on_attach = function(_, buffer)
			-- Hover actions
			keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
}
