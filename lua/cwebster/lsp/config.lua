local M = {}

-- local null_ls = require("null-ls")

-- M.null_ls_sources = {
--   -- formatters
--   null_ls.builtins.formatting.stylua,
--   -- null_ls.builtins.formatting.eslint_d,
--   null_ls.builtins.formatting.prettier.with({
--     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql", "svelte", "toml" }
--   }),
--   null_ls.builtins.formatting.gofmt,
--   null_ls.builtins.formatting.goimports,
--   null_ls.builtins.formatting.rustfmt,

--   -- diagnostics
--   -- trying nvim-lint to handle diagnostics.
--   -- null_ls.builtins.diagnostics.actionlint,
--   -- null_ls.builtins.diagnostics.eslint_d,
--   -- null_ls.builtins.diagnostics.gitlint,
--   -- null_ls.builtins.diagnostics.vale,
--   -- null_ls.builtins.diagnostics.hadolint.with({
--   --   command = "docker",
--   --   args = { "run", "--rm", "-i", "hadolint/hadolint", "hadolint", "--no-color", "-"},
--   -- }),
--   -- null_ls.builtins.diagnostics.shellcheck,

--   -- code actions
--   null_ls.builtins.code_actions.gitsigns,
--   null_ls.builtins.code_actions.eslint_d,
-- }

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
  dockerls = {},
  jsonls = {},
  -- clangd = {
  --   handlers = lsp_status.extensions.clangd.setup(),
  -- },
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
  -- jdtls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  },
}

return M
