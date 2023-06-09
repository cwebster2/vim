return {
	-- PLUGINS: Markdown
	-- { "plasticboy/vim-markdown",
	--   ft = {"markdown"},
	--   init = function() require('cwebster.markdown').markdown_setup() end,
	-- }
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		-- ft = { "markdown" },
		-- init = function() vim.g.mkdp_filetypes = { "markdown" } end,
		init = function()
			require("cwebster.markdown").mkdp_setup()
		end,
	},
}
