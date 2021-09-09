local M={}

local nvim_lsp = require "lspconfig"
local saga = require'lspsaga'
local lsp_signature = require("lsp_signature")

-- EFM linting
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local hadolint = require "efm/hadolint"
local language_formatters = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  lua = {
    {formatCommand = "lua-format -i", formatStdin = true}
  },
  dockerfile = {hadolint},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
-- turn on `window/workDoneProgress` capability

-- Heplers for lua lsp setup
local function lua_cmd()
  local home = vim.fn.expand("$HOME")
  local build = home .. "/src/lua-language-server"
  local bin_location = ""
  if jit.os == 'OSX' then
    bin_location = 'macOS'
  elseif jit.os == 'Linux' then
    bin_location = 'Linux'
  end
  local bin = build .. "/bin/" .. bin_location .. "/lua-language-server"
  return {bin, "-E", build .. "/main.lua"}
end
-- end helpers for lua lsp setup

local servers = {
  pyright = {},
  bashls = {},
  -- rust-tools configures this
  -- rust_analyzer = {},
  tsserver = {},
  vuels = {},
  svelte = {},
  gopls = {},
  terraformls = {
    filetypes = {"tf", "terraform"},
  },
  --dockerls = {},
  jsonls = {},
  texlab = {
    settings = {
      latex = {
        build = {
          executable = "pdflatex",
          onSave = true;
        }
      }
    }
  },
  yamlls = {},
  vimls = {},
  jdtls = {},
  sumneko_lua = require("lua-dev").setup({
    lspconfig = {
      cmd = lua_cmd(),
    },
  }),
  efm = {
    filetypes = vim.tbl_keys(language_formatters),
    init_options = {
      documentFormatting = true,
      codeAction = true,
      completion = true,
      documentSymbol = true,
      hover = true,
    },
    settings = {
      rootMarkers = {".git/"},
      languages = language_formatters
    }
  },
  -- coffeescript = {
  --   cmd = { bin_name, '--stdio' },
  --   filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  --   root_dir = function(fname)
  --     return util.root_pattern 'tsconfig.json'(fname)
  --       or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  --   end,
  -- }
}

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
  local config = { on_attach = on_attach, capabilities = capabilities }
  return config
end

function M.setup()

  for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = capabilities }, config))
  end

  --vim.lsp.callbacks['textDocument/codeAction'] = custom_codeAction

  --vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  --vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  --vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  --vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  --vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  --vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  --vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  --vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

  vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        vim.api.nvim_command("noautocmd :update")
    end
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {
        spacing = 4,
        prefix = '←',
      },
      signs = true,
      update_in_insert = false,
    }
  )

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

  end

  return M
