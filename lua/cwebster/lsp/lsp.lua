local ok, nvim_lsp = pcall(require,"lspconfig")

if not ok then
  print("lspconfig is not installed")
  do return end
end

local null_ls = require("null-ls")
local neodev = require("neodev")
local navic = require("nvim-navic")
local rust_tools = require('rust-tools')
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_lines = require("lsp_lines")

-- the servers we want

local servers = require("cwebster.lsp.servers")

-- config


-- handlers

local function get_capabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
  capabilities.window = capabilities.window or {}
  capabilities.window.workDoneProgress = true

  return capabilities
end

local on_attach = function(client, bufnr)

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- lsp_signature.on_attach(lsp_signature_config)

  require("cwebster.mappings").lsp_setup(client, bufnr)

  --vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  --

  -- This is causing an out of bounds error, see if this changed in a nightly
  -- vim.api.nvim_command("autocmd BufWrite,BufEnter,InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})")
  vim.api.nvim_command [[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]]
  -- vim.api.nvim_command [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
  end
end

-- plugin setups

rust_tools.setup({
  tools = { -- rust-tools options
    autoSetHints = true,

    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "<-",
      other_hints_prefix  = "=>",
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
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"}
      },
    },

    -- runnables = { use_telescope = true }
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = { on_attach = on_attach, capabilities = get_capabilities() }
})

neodev.setup({
  library = {
    plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  }
})

null_ls.setup({
  sources = null_ls_sources,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = on_attach,
})

lsp_lines.setup()
-- registration

for server, config in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = get_capabilities() }, config))
end


