local node = os.getenv("HOME") .. "/.local/share/fnm/node-versions/v16.15.1/installation/bin/node"

return {
	-- PLUGINS: copilot
	-- { "github/copilot.vim",
	--   init = "require('cwebster.copilot').setup()"
	-- vim.g.copilot_no_tab_map = true
	-- vim.g.copilot_assume_mapped = true
	-- vim.g.copilot_tab_fallback = ""
	-- vim.g.copilot_node_command = node
	-- }
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		opts = {
			ft_disable = { "markdown" },
			copilot_node_command = node,
		},
		config = function(plugin)
			vim.defer_fn(function()
				require("copilot").setup(plugin.opts)
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
		dependencies = { "copilot.lua" },
		opts = {
			method = "getCompletionsCycling",
		},
	},
}
