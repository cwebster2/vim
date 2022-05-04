local M={}

local nvim_lsp = require "lspconfig"
local lsp = vim.lsp
local lsp_signature = require("lsp_signature")
local lsp_status = require("lsp-status")


local function get_capabilities()
  local capabilities = lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  capabilities.window = capabilities.window or {}
  capabilities.window.workDoneProgress = true

  return capabilities
end

lsp_status.config {
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ["start"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[1])
        },
        ["end"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[2])
        }
      }

      return require("lsp-status.util").in_range(cursor_pos, value_range)
    end
  end,
  diagnostics = false,
  current_function = false,
  status_symbol = '',
}
lsp_status.register_progress()


local lsp_signature_config = {
  bind = true,
  doc_lines = 0,
  floating_window = true,
  hint_enable = true,
  handler_opts = {
    border = "single"
  },
  -- fix_pos = true,
}

local on_attach = function(client, bufnr)

  -- if client.name == "tsserver" then
  --   client.resolved_capabilities.document_formatting = false
  -- end

  lsp_signature.on_attach(lsp_signature_config)
  lsp_status.on_attach(client)

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

local function custom_codeAction(_, _, action)
  print(vim.inspect(action))
end

function M.get_server_config()
  local config = { on_attach = on_attach, capabilities = get_capabilities() }
  return config
end

function M.setup()

  local servers = require("cwebster.lsp.config").servers

  for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = get_capabilities() }, config))
  end

  --lsp.callbacks['textDocument/codeAction'] = custom_codeAction

  require("cwebster.lsp.handlers").setup()

end

return M
