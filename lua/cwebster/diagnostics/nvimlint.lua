local M = {}
local lint = require("lint")

function M.setup()
  lint.linters_by_ft = {
    -- javascript = {}
  }
end

return M

-- M.null_ls_sources = {
--   null_ls.builtins.formatting.stylua,
--   null_ls.builtins.formatting.eslint_d,
--   null_ls.builtins.formatting.prettier.with({
--     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql", "svelte", "toml" }
--   }),
--   null_ls.builtins.formatting.gofmt,
--   null_ls.builtins.formatting.goimports,
--   null_ls.builtins.formatting.rustfmt,
--   null_ls.builtins.diagnostics.eslint_d,
--   null_ls.builtins.diagnostics.hadolint.with({
--     command = "docker",
--     args = { "run", "--rm", "-i", "hadolint/hadolint", "hadolint", "--no-color", "-"},
--   }),
--   null_ls.builtins.diagnostics.shellcheck,
--   null_ls.builtins.diagnostics.write_good,
--   null_ls.builtins.code_actions.proselint,
--   null_ls.builtins.code_actions.gitsigns,
--   null_ls.builtins.code_actions.eslint_d,
-- }
