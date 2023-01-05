
vim.diagnostic.config({
  underline = true,
  virtual_text = {
    source = "if_many",
    spacing = 3,
    prefix = '←',
  },
  virtual_lines = false,
  signs = true,
  severity_sort = true,
  update_in_insert = true,
})


local ok, lint = pcall(require, "lint")

if not ok then
  print("Lint is not installed")
  do return end
end


lint.linters_by_ft = {
  text = {'vale',},
  markdown = {'vale',},
  rst = {'vale',},
  dockerfile = {'hadolint',},
  javascript = { 'eslint', },
  typescript = { 'eslint', },
  vue = { 'eslint', },
  svelte = { 'eslint', },
  json = { 'eslint', },
  yaml = { 'eslint', },
  toml = { 'eslint', },
  sh = { 'shellcheck' },
  zsh = { 'shellcheck' },
  bash = { 'shellcheck' },
}

vim.api.nvim_create_autocmd("BufWritePost", { callback = function() lint.try_lint() end })

