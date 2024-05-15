return {
	"voldikss/vim-floaterm",
	keys = {
		{"n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ", desc = "Open floaterm"},
		{"n", "t", ":FloatermToggle myfloat<CR>", desc = "Toggle floaterm"},
		{"t", "<Esc>", "<C-\\><C-n>:q<CR>", desc = "Close floaterm"},
	}
}
