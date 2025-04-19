return {
	{
		"anuvyklack/hydra.nvim",
		opts = {
			name = "Window Ops",
			mode = "n",
			-- config = {},
			body = "<C-w>",
			heads = {
				-- move
				{ "m", "<C-w>h" },
				{ "n", "<C-w>j" },
				{ "e", "<C-w>k" },
				{ "i", "<C-w>l" },
			},
		},
		config = function(plugin, _)
			local hydra = require("hydra")
			hydra(plugin.opts)
		end,
	},
}
