return {
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		opts = {
			disable_signs = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = true,
			signs = {
				-- { CLOSED, OPENED }
				section = { ">", "v" },
				item = { ">", "v" },
				hunk = { "", "" },
			},
			integrations = {
				diffview = true,
			},
		},
	},
}
