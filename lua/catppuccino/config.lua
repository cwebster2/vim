---@class Config
local config = {}

config.options = {
	colorscheme = "dark_catppuccino",
	transparency = true,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "italic",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
    galaxyline = true,
		lsp_trouble = true,
		lsp_saga = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
    cmp = true,
		nvimtree = {
			enabled = true,
			show_root = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = false,
		neogit = true,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = true,
	},
}

function config.set_options(opts)
	opts = opts or {}
	config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
