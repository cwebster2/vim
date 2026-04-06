return {
	{
		"akinsho/nvim-toggleterm.lua",
		opts = {
			open_mapping = [[<c-Q>]],
			hide_numbers = true,
			shade_filetypes = {},
			highlights = {
				Normal = {
					guibg = "NONE",
				},
				NormalFloat = {
					link = "Normal",
				},
				ExtraWhiteSpace = {
					guibg = "NONE",
					guifg = "NONE",
				},
				FloatBorder = {
					guibg = "NONE",
					guifg = "grey",
				},
			},
			shade_terminals = true,
			shading_factor = "1",
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.env.SHELL,
			float_opts = {
				border = "curved",
				winblend = 10,
			},
			winbar = {
				enabled = false,
			},
		},
	},
}
