local M={}

local nvim_lsp = require "lspconfig"
local saga = require'lspsaga'
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
  --local completion = require "completion"
  --completion.on_attach(client)

  local opts = {noremap = true, silent = true}
  map("n", "gD",        "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  --map("n", "gd",        "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --map("n", "ga",        "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "gk",        "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  --map("n", "K",         "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  --map('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map("n", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  --map("n", "gr",      "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  --map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  --map("n", "[g",        "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  --map("n", "]g",        "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

  map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
  map("n", "gR", "<cmd>LspTroubleToggle lsp_references<cr>", opts)
  --map("n", "ga", "<Cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>", opts)

  map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
  map("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
  map("v", "ga", "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
  map("n", "K",         "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  map('n', '<C-k>',     "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  map("n", "<leader>r", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
  map("n", "gd",        "<Cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
  --map("n", "gd",        "<Cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
  map("n", "<leader>d", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
  map("n", "[g",        "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
  map("n", "]g",        "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)

  --vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
  -- This is causing an out of bounds error, see if this changed in a nightly
  vim.api.nvim_command("autocmd BufWrite,BufEnter,InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})")
  vim.api.nvim_command [[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]]
  vim.api.nvim_command [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  elseif client.resolved_capabilities.document_range_formatting then
    map("v", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  end
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
