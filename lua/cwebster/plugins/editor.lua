return {
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_end_of_line = true,
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
			show_trailing_blankline_indent = true,
			-- char_highlight_list = {
			--     "IndentBlanklineIndent1",
			--     "IndentBlanklineIndent2",
			--     "IndentBlanklineIndent3",
			--     "IndentBlanklineIndent4",
			--     "IndentBlanklineIndent5",
			--     "IndentBlanklineIndent6",
			-- },
		},
		config = function(plugin, _)
			require("indent_blankline").setup(plugin.opts)
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("cwebster.ui.hlslens").setup()
		end,
		dependencies = {
			"petertriho/nvim-scrollbar",
			config = function()
				require("cwebster.ui.scrollbar").setup()
			end,
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("cwebster.ui.gitsigns").setup()
		end,
	},

	{ "szw/vim-maximizer", lazy = true, cmd = "MaximizerToggle" },

	{
		"SmiteshP/nvim-navic",
		opts = {
			icons = {
				File = " ",
				Module = " ",
				Namespace = " ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = "練",
				Interface = "練",
				Function = " ",
				Variable = " ",
				Constant = " ",
				String = " ",
				Number = " ",
				Boolean = "◩ ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = "ﳠ ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
			highlight = true,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
		},
		config = function(plugin, _)
			local navic = require("nvim-navic")
			navic.setup(plugin.opts)
			local util = require("cwebster.utils")
			util.on_attach(function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end)
		end,
	},

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

	{
		"folke/which-key.nvim",
		opts = {
			operators = { gc = "Comments", ys = "Surround", yS = "Surround" },
			window = { winblend = 30 },
		},
		config = function(plugin, opts)
			local util = require("cwebster.utils")
			local wk = require("which-key")
			wk.setup(plugin.opts)

			local leader_map = {}
			leader_map.g = { name = "+git" }
			leader_map.g.h = { name = "+hunks" }
			leader_map.b = { name = "+buffer" }
			leader_map.h = { name = "+help" }
			leader_map.h.p = { name = "+packer" }
			leader_map.f = { name = "+find" }
			leader_map.s = { name = "+search" }
			leader_map.x = { name = "+trouble" }
			leader_map.t = { name = "+testing" }
			leader_map.d = { name = "+debug" }
			local normal_map = {
				["g"] = {
					name = "+goto",
					["z"] = {
						name = "+zettle",
						n = { "New" },
						z = { "Find/create" },
						Z = { "Insert ID" },
						b = { "Backlinks" },
						B = { "Id of backlink" },
						t = { "Find/insert tags" },
						s = { "Start server" },
						["]"] = { "Next Link" },
						["["] = { "Prev Link" },
					},
				},
			}

			wk.register(leader_map, { prefix = "<leader>" })
			wk.register(normal_map)

			util.on_attach(function(_, bufnr)
				local keymap = {}
				keymap.c = { name = "+Code Actions" }
				keymap.c.l = { name = "+LSP Actions" }
				keymap.x = { name = "+LSP Diagnostics" }
				local visual_keymap = {}
				visual_keymap.c = { name = "+Code Actions" }
				local goto_keymap = {}
				goto_keymap.g = { name = "+goto" }
				wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
				wk.register(visual_keymap, { buffer = bufnr, prefix = "<leader>", mode = "v" })
				wk.register(goto_keymap, { buffer = bufnr, prefix = "g" })
			end)
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("cwebster.symbols").setup()
		end,
	},
	{ "unblevable/quick-scope" },
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("cwebster.surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("cwebster.neoterm").setup()
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("cwebster.diagnostics.nvimlint").setup()
		end,
	},
	{
		"folke/lsp-trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("cwebster.trouble").setup()
		end,
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("cwebster.ui.ccc").setup()
		end,
	},
	{ "almo7aya/openingh.nvim" },
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({ comment_empty = false })
		end,
	},
}
