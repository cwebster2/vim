return {
	{
		"terrortylor/nvim-comment",
		opts = { comment_empty = false },
		config = function(plugin)
			require("nvim_comment").setup(plugin.opts)
		end,
	},
}
