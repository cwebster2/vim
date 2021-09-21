local M = {}

local prettier = require "lsp.efm.prettier"
local eslint = require "lsp.efm.eslint"
local hadolint = require "lsp.efm.hadolint"

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

M.servers = {
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

return M
