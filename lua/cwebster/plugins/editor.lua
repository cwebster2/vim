return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		opts = {
			char = "▏",
			show_end_of_line = false,
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
			show_trailing_blankline_indent = true,
			use_treesitter = true,
			use_treesitter_scope = true,
			filetype_exclude = {
				"help",
				"vimwiki",
				"startify",
				"man",
				"git",
				"packer",
				"gitmessengerpopup",
				"diagnosticpopup",
				"markdown",
				"lspinfo",
			},
			-- char_highlight_list = {
			-- "IndentBlanklineIndent1",
			--     "IndentBlanklineIndent2",
			--     "IndentBlanklineIndent3",
			--     "IndentBlanklineIndent4",
			--     "IndentBlanklineIndent5",
			--     "IndentBlanklineIndent6",
			-- },
		},
	},
	{
		"kevinhwang91/nvim-hlslens",
		dependencies = {
			"nvim-scrollbar",
		},
		opts = {
			calm_down = true,
			nearest_only = false,
			nearest_float_when = "auto",
			virt_priority = 10,
			override_lens = function(render, posList, nearest, idx, relIdx)
				local sfw = vim.v.searchforward == 1
				local indicator, text, chunks
				local absRelIdx = math.abs(relIdx)
				if absRelIdx > 1 then
					indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and "▲" or "▼")
				elseif absRelIdx == 1 then
					indicator = sfw ~= (relIdx == 1) and "▲" or "▼"
				else
					indicator = ""
				end

				local lnum, col = unpack(posList[idx])
				if nearest then
					local cnt = #posList
					if indicator ~= "" then
						text = ("[%s %d/%d]"):format(indicator, idx, cnt)
					else
						text = ("[%d/%d]"):format(idx, cnt)
					end
					chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
				else
					text = ("[%s %d]"):format(indicator, idx)
					chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
				end
				render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
			end,
		},
		config = function(plugin, _)
			require("scrollbar.handlers.search").setup(plugin.opts)
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		config = function()
			local sb = require("scrollbar")
			local colors = require("cwebster.colors").get_colors()

			sb.setup({
				handle = {
					text = " ",
					color = colors.black,
				},
				marks = {
					Search = { text = { "-", "=" }, priority = 0, colors.orange },
					Error = { text = { "-", "=" }, priority = 1, colors.red },
					Warn = { text = { "-", "=" }, priority = 2, colors.yellow },
					Info = { text = { "-", "=" }, priority = 3, colors.blue },
					Hint = { text = { "-", "=" }, priority = 4, colors.green },
					Misc = { text = { "-", "=" }, priority = 5, colors.purple },
				},
				excluded_filetypes = {
					"",
					"prompt",
					"TelescopePrompt",
				},
				autocmd = {
					render = {
						"BufWinEnter",
						"TabEnter",
						"TermEnter",
						"WinEnter",
						"CmdwinLeave",
						"TextChanged",
						"VimResized",
						"WinScrolled",
					},
				},
				handlers = {
					diagnostic = true,
					search = true,
				},
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-scrollbar",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "▎",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "‾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "▋",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			numhl = false,
			linehl = false,
			keymaps = {
				-- Default keymap options
				noremap = true,
				buffer = true,

				["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
				["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

				["n <leader>ghs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
				["n <leader>ghu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
				["n <leader>ghr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
				["n <leader>ghR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
				["n <leader>ghp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
				["n <leader>ghb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

				-- Text objects
				["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
				["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
			},
			watch_gitdir = {
				interval = 1000,
			},
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			diff_opts = {
				internal = true, -- If luajit is present
			},
		},
		config = function(plugin)
			require("gitsigns").setup(plugin.opts)
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	{ "szw/vim-maximizer", lazy = true, cmd = "MaximizerToggle" },

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
		opts = {
			highlight_hovered_item = true,
			show_guides = true,
			auto_preview = false,
			position = "right",
			width = 20,
			keymaps = {
				close = "<Esc>",
				goto_location = "<Cr>",
				focus_location = "o",
				hover_symbol = "<C-space>",
				rename_symbol = "r",
				code_actions = "a",
				toggle_preview = "K",
			},
			lsp_blacklist = {},
		},
	},
	{ "unblevable/quick-scope" },
	{
		"kylechui/nvim-surround",
		version = "*",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
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
	{
		"mfussenegger/nvim-lint",
		opts = {
			text = { "vale" },
			markdown = { "vale" },
			rst = { "vale" },
			dockerfile = { "hadolint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			vue = { "eslint" },
			svelte = { "eslint" },
			json = { "eslint" },
			yaml = { "eslint" },
			toml = { "eslint" },
			sh = { "shellcheck" },
			zsh = { "shellcheck" },
			bash = { "shellcheck" },
		},
		config = function(plugin)
			require("lint").linters_by_ft = plugin.opts
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"folke/lsp-trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {
			action_keys = {
				previous = "e",
				next = "n",
			},
			auto_open = false,
			auto_close = false,
			use_diagnostic_signs = true,
		},
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = true,
	},
	{
		"uga-rosa/ccc.nvim",
		opts = {
			highlighter = {
				auto_enable = true,
			},
		},
	},

	{ "almo7aya/openingh.nvim" },
	{
		"terrortylor/nvim-comment",
		opts = { comment_empty = false },
		config = function(plugin)
			require("nvim_comment").setup(plugin.opts)
		end,
	},
}
