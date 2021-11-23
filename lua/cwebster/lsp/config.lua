local M = {}

local lsp_status = require("lsp-status")
local null_ls = require("null-ls")

local null_ls_sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.terraform_fmt,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.diagnostics.shellcheck,
}

null_ls.config({
  sources = null_ls_sources,
  diagnostics_format = "[#{c}] #{m} (#{s})"
})
-- local la(guage_formatters = {
--   typescript = {prettier, eslint},
--   javascript = {prettier, eslint},
--   typescriptreact = {prettier, eslint},
--   javascriptreact = {prettier, eslint},
--   yaml = {prettier},
--   json = {prettier},
--   html = {prettier},
--   scss = {prettier},
--   css = {prettier},
--   markdown = {prettier},
--   lua = {
--     {formatCommand = "lua-format -i", formatStdin = true}
--   },
--   dockerfile = {hadolint},
-- }

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
  html = {},
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
  clangd = {
    handlers = lsp_status.extensions.clangd.setup(),
  },
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
  ["null-ls"] = {},
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
