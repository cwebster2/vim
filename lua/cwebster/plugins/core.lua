return {
	-- PLUGINS_BEGIN
	-- PLUGINS: Colorschemes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("cwebster.colors").setup()
		end,
	},

	-- PLUGINS: Core
	{ "dstein64/vim-startuptime" },

	-- PLUGINS: Startup
	{
		"mhinz/vim-startify",
		config = function()
			require("cwebster.startify").setup()
		end,
	},

	-- stuff to try
	-- https://github.com/nyngwang/NeoTerm.lua
	-- https://github.com/pianocomposer321/yabs.nvim
	-- https://github.com/Shatur/neovim-session-manager
	-- https://github.com/kosayoda/nvim-lightbulb with new config
	-- nvim-neorg/neorg

	-- PLUGINS: language stuff
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
	{
		"NTBBloodbath/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
			},
			-- Jump to request line on run
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		},
	},
	{ "editorconfig/editorconfig-vim" },
	{
		"ntpeters/vim-better-whitespace",
		config = function()
			require("cwebster.whitespace").setup()
		end,
	},

	-- PLUGINS: PDE features
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
	{
		"cwebster2/mocha-runner.nvim",
		config = function()
			require("mocha-runner").setup({})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		-- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
	},
	{ "metakirby5/codi.vim" },
	{ "junegunn/gv.vim" },

	-- PLUGINS: Testing
	{ "janko/vim-test", lazy = true },

	-- PLUGINS: Debugging
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("cwebster.dap").setup()
		end,
	},
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

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

	-- PLUGINS: LaTeX
	{ "vim-latex/vim-latex", ft = "tex" },

	-- PLUGINS: The Rest
	{ "airblade/vim-rooter" },
	{ "tpope/vim-eunuch" },

	-- still evaluating if these are needed now
	--Plug "mattn/emmet-vim"
	{
		"sheerun/vim-polyglot",
		init = function()
			vim.g.polyglot_disabled = { "autoindent", "sensible" }
		end,
	}, -- syntax files for most languages

	-- PLUGINS_END
}
