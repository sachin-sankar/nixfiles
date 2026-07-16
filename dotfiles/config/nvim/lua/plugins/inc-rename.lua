return {
	"smjonas/inc-rename.nvim",
	lazy = false,
	opts = {
		input_buffer_type = "snacks",
	},
	keys = {
		{
			"<leader>cn",
			function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end,
			expr = true,
			desc = "Incremental Rename",
		},
	},
}
