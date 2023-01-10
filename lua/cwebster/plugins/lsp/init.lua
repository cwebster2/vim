return {
	-- PLUGINS: LSP
	{
		"folke/neodev.nvim",
		opts = {
			library = {
				plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
			},
		},
		config = true,
	},

	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "neodev.nvim" },
			{ "mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "rust-tools.nvim" },
		},
		opts = {
			servers = {
				pyright = {},
				html = {},
				bashls = {},
				-- rust-tools configures this
				-- rust_analyzer = {},
				tsserver = {},
				vuels = {},
				svelte = {},
				gopls = {},
				terraformls = {
					filetypes = { "tf", "terraform" },
				},
				dockerls = {},
				jsonls = {},
				-- clangd = {
				--   handlers = lsp_status.extensions.clangd.setup(),
				-- },
				texlab = {
					settings = {
						latex = {
							build = {
								executable = "pdflatex",
								onSave = true,
							},
						},
					},
				},
				yamlls = {},
				vimls = {},
				sumneko_lua = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
			setup = {},
		},
		config = function(plugin, opts) -- plugins, opts
			-- does this go somewhere better?
			vim.diagnostic.config({
				underline = true,
				virtual_text = {
					source = "if_many",
					spacing = 3,
					prefix = "←",
				},
				virtual_lines = false,
				signs = true,
				severity_sort = true,
				update_in_insert = true,
			})
			-- set diagnostic signs?

			require("cwebster.utils").on_attach(function(client, buffer)
				require("cwebster.plugins.lsp.format").on_attach(client, buffer)
				-- require("cwebster.plugins.lsp.keymaps").on_attach(client, buffer)
				require("cwebster.mappings").lsp_setup(client, buffer)

				if client.name == "tsserver" then
					client.server_capabilities.documentFormattingProvider = false
				end

				--vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")

				-- This is causing an out of bounds error, see if this changed in a nightly
				-- vim.api.nvim_command("autocmd BufWrite,BufEnter,InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})")
				vim.api.nvim_command([[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]])
				-- vim.api.nvim_command [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

				if client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
					vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
					vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
				end
			end)

			local servers = plugin.opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
			require("mason-lspconfig").setup_handlers({
				function(server)
					local server_opts = servers[server] or {}
					server_opts.capabilities = capabilities
					if opts.setup[server] then
						if opts.setup[server](server, server_opts) then
							return
						end
					elseif opts.setup["*"] then
						if opts.setup["*"](server, server_opts) then
							return
						end
					end
					require("lspconfig")[server].setup(server_opts)
				end,
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "mason.nvim" },
		},
		event = "BufReadPre",
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.stylua,
					-- null_ls.builtins.formatting.eslint_d,
					nls.builtins.formatting.prettier.with({
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"yaml",
							"markdown",
							"graphql",
							"svelte",
							"toml",
						},
					}),
					nls.builtins.formatting.gofmt,
					nls.builtins.formatting.goimports,
					nls.builtins.formatting.rustfmt,
					-- code actions
					nls.builtins.code_actions.gitsigns,
					nls.builtins.code_actions.eslint_d,
				},
			}
		end,
		-- null_ls.setup({
		--   sources = require("cwebster.lsp.config").null_ls_sources,
		--   diagnostics_format = "[#{c}] #{m} (#{s})",
		--   on_attach = on_attach,
		-- })
	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ui = {
				icons = {
					server_installed = "✓",
					server_pending = "➜",
					server_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(plugin.opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	{
		"simrat39/rust-tools.nvim",
		opts = {
			tools = { -- rust-tools options
				autoSetHints = true,

				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "<-",
					other_hints_prefix = "=>",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 7,
				},

				hover_actions = {
					-- the border that is used for the hover window
					-- see vim.api.nvim_open_win()
					auto_focus = true,
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
				},
				-- runnables = { use_telescope = true }
			},
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		enabled = true,
		opts = {
			bind = false,
			doc_lines = 0,
			floating_window = true,
			hint_enable = true,
			handler_opts = {
				border = "single",
			},
		},
		config = function(plugin, opts)
			require("lsp_signature").on_attach(plugin.opts)
		end,
	},

	{ "onsails/lspkind.nvim" },
}
