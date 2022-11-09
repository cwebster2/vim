local M={}

local lsp_signature = require("lsp_signature")
local null_ls = require("null-ls")
-- local neodev = require("neodev")
local navic = require("nvim-navic")

-- neodev.setup({})

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

local lsp_signature_config = {
  bind = false,
  doc_lines = 0,
  floating_window = true,
  hint_enable = true,
  handler_opts = {
    border = "single"
  },
  -- fix_pos = true,
}

local on_attach = function(client, bufnr)

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  lsp_signature.on_attach(lsp_signature_config)

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

null_ls.setup({
  sources = require("cwebster.lsp.config").null_ls_sources,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = on_attach,
})

function M.get_server_config()
  local config = { on_attach = on_attach, capabilities = get_capabilities() }
  return config
end

function M.setup()

  local servers = require("cwebster.lsp.config").servers
  local nvim_lsp = require "lspconfig"

  for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = get_capabilities() }, config))
  end

  require("cwebster.lsp.handlers").setup()

end

return M
