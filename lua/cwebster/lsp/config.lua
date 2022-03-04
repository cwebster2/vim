local M = {}

local lsp_status = require("lsp-status")
local null_ls = require("null-ls")

M.null_ls_sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql", "svelte", "toml" }
  }),
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.goimports,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.hadolint.with({
    command = "docker",
    args = { "run", "--rm", "-i", "hadolint/hadolint", "hadolint", "--no-color", "-"},
  }),
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.code_actions.proselint,
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.eslint_d,
}


-- local la(guage_formatters = {
--   lua = {
--     {formatCommand = "lua-format -i", formatStdin = true}
--   },
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
