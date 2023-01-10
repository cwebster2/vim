return {
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("cwebster.ui.bufferline").setup()
		end,
	},
	{
		"rebelot/heirline.nvim",
		dependencies = { "nvim-navic" },
		config = function()
			require("cwebster.heirline").setup()
		end,
	},
	{
		"folke/noice.nvim",
		event = "VimEnter",
		enabled = true,
		config = function()
			require("cwebster.ui.noice").setup()
		end,
		dependencies = {
			{
				"rcarriga/nvim-notify",
				enabled = true,
				config = function()
					require("cwebster.ui.notify").setup()
				end,
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("cwebster.ui.dressing").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("cwebster.neotree").setup()
		end,
	},
}
