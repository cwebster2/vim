local M={}

local nvim_lsp = require "lspconfig"
local lsp = vim.lsp
local saga = require'lspsaga'
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
  }
}

local on_attach = function(client, bufnr)

  lsp_signature.on_attach(lsp_signature_config)
  lsp_status.on_attach(client)

  require("_mappings").lsp_setup(client, bufnr)

  --vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  --

  -- This is causing an out of bounds error, see if this changed in a nightly
  -- vim.api.nvim_command("autocmd BufWrite,BufEnter,InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})")
  vim.api.nvim_command [[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]]
  vim.api.nvim_command [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

  if client.resolved_capabilities.document_highlight then
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

  local servers = require("lsp.config").servers

  for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = get_capabilities() }, config))
  end

  --lsp.callbacks['textDocument/codeAction'] = custom_codeAction

  require("lsp.handlers").setup()

  saga.init_lsp_saga {
    use_saga_diagnostic_sign = false,
    finder_action_keys = {
      open = 'o',
      vsplit = 's',
      split = 'i',
      quit = {'q','<esc>'},
      scroll_down = '<C-f>',
      scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = {'q','<esc>'},
      exec = '<CR>',
    },
    rename_action_keys = {
      quit = {'<C-c>', '<esc>'},
      exec = '<CR>',
    },
  }

  register_kinds()

end

function register_kinds()
  require('vim.lsp.protocol').CompletionItemKind = {
    ' Text';        -- = 1
    'ƒ Method';      -- = 2;
    ' Function';    -- = 3;
    ' Constructor'; -- = 4;
    'Field';         -- = 5;
    ' Variable';    -- = 6;
    ' Class';       -- = 7;
    'ﰮ Interface';   -- = 8;
    ' Module';      -- = 9;
    ' Property';    -- = 10;
    ' Unit';        -- = 11;
    ' Value';       -- = 12;
    '了Enum';        -- = 13;
    ' Keyword';     -- = 14;
    '﬌ Snippet';     -- = 15;
    ' Color';       -- = 16;
    ' File';        -- = 17;
    'Reference';     -- = 18;
    ' Folder';      -- = 19;
    ' EnumMember';  -- = 20;
    ' Constant';    -- = 21;
    ' Struct';      -- = 22;
    'Event';         -- = 23;
    'Operator';      -- = 24;
    'TypeParameter'; -- = 25;
  }
end

return M


