local M={}

local nvim_lsp = require "lspconfig"
local completion = require "completion"
local map = require("utils").map
local home = vim.fn.expand("$HOME")
local build = home .. "/src/lua-language-server"
local bin = build .. "/bin/Linux/lua-language-server"

local servers = {
  pyls = {},
  bashls = {},
  rust_analyzer = {},
  tsserver = {},
  gopls = {},
  terraformls = {},
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
  }
}

local on_attach = function(client)
  completion.on_attach(client)

  local opts = {noremap = true, silent = true}
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
  map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  map("n", "[g", "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  map("n", "]g", "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
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
      disable = { "ruby" },
    },
    rainbow = {
      enable = true,
      disable = {'bash'},
    },
    refactor = {
      highlight_definitions = { enable = true },
      --highlight_current_scope = { enable = true },
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
    },
    string = {
      { complete_items = { 'path'} },
    },
  }
  end
  -- tab for completion
  --map('i', '<Tab>', "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", {expr=true, noremap=true})
  vim.api.nvim_command [[
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  ]]
  map('i', '<S-Tab>', "pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"", {expr=true, noremap=true})
  --map('i', '<cr>', "pumvisible() ? complete_info()[\"selected\"] != \"-1\" ? \"\\<Plug>(completion_confirm_completion)\"  : \"\\<c-e>\\<CR>\" :  \"\\<CR>\"", {expr=true})

  return M
