return {
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
		opts = {
			-- Open request results in a horizontal split
			result_split_horizontal = false,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = false,
			-- Highlight request on run
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				show_http_info = true,
				show_headers = true,
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
			},
			-- Jump to request line on run
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		},
	},
}
