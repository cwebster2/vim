return {
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
}
