return {
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
}
