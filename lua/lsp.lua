local M={}

local nvim_lsp = require "lspconfig"
local completion = require "completion"
local map = require("utils").map
local home = vim.fn.expand("$HOME")
local build = home .. "/src/lua-language-server"
local bin = build .. "/bin/Linux/lua-language-server"

local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local language_formatterts = {
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
  }
}

local servers = {
  pyls = {},
  bashls = {},
  rust_analyzer = {},
  tsserver = {},
  vuels = {},
  gopls = {},
  terraformls = {
    filetypes = {"tf", "terraform"},
  },
  dockerls = {},
  jsonls = {},
  texlab = {},
  yamlls = {},
  vimls = {},
  jdtls = {},
  sumneko_lua = {
    cmd = {bin, "-E", build .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },
        completion = {
          keywordSnippet = "Disable"
        },
        diagnostics = {
          enable = true,
          globals = {
            "vim"
          }
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  },
  efm = {
    filetypes = vim.tbl_keys(language_formatterts),
    root_dir = nvim_lsp.util.root_pattern("package.json","yarn.lock", ".git"),
    init_options = {
      documentFormatting = true,
      codeAction = true
    },
    settings = {
      rootMarkers = {".git/"},
      languages = language_formatterts
    }
  }
}

local on_attach = function(client)
  completion.on_attach(client)

  local opts = {noremap = true, silent = true}
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --map("n", "gd", "<Cmd>lua require'lspsaga.provider'.preview_definiton()<CR>", opts)
  map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  --map("n", "ga", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
  map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
  --map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  map("n", "[g", "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  map("n", "]g", "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  --map("n", "[g", "<cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  --map("n", "]g", "<cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
  vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
  vim.api.nvim_command("autocmd InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})")
  vim.api.nvim_command [[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]]

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    map("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  vim.api.nvim_command [[
    imap <buffer><expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<CR>" : "\<Plug>(PearTreeExpand)"
  ]]

end

local function custom_codeAction(_, _, action)
  print(vim.inspect(action))
end

function M.setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
    },
    highlight = {
      enable = true,
      disable = {},
    },
    rainbow = {
      enable = true,
      disable = {'bash'},
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
    }
  }

  for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", { on_attach = on_attach }, config))
  end

  --vim.lsp.callbacks['textDocument/codeAction'] = custom_codeAction

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

  vim.g.completion_enable_snippet = "Neosnippet"
  vim.g.completion_matching_ignore_case = 1
  vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
  vim.g.completion_auto_change_source = 1
  vim.g.completion_trigger_on_delete = 1
  vim.g.completion_enable_auto_hover = 1
  vim.g.completion_enable_auto_signature = 1
  vim.g.completion_enable_auto_paren = 1
  --vim.g.completion_confirm_key = ""
  vim.g.completion_chain_complete_list = {
    default = {
      { complete_items = { 'lsp', 'snippet', 'path', 'buffers', 'tags'} },
      {complete_items = {'path'}, triggered_only = {'/'}},
    },
    string = {
      {complete_items = {'path'}, triggered_only = {'/'}},
      { complete_items = { 'buffers'} },
    },
  }
  end

  --saga

  --local opts = {
  --}
  --
  --local saga = require'lspsaga'
  --
  --saga.init_lsp_saga(opts)

  return M
