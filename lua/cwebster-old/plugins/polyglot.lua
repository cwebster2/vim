return {
	{
		"sheerun/vim-polyglot",
		init = function()
			vim.g.polyglot_disabled = { "autoindent", "sensible" }
		end,
	}, -- syntax files for most languages
}
