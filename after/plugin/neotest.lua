local ok, neotest = pcall(require, "neotest")

if not ok then
  print("neotest not installed, run PackerSync")
  do return end
end

neotest.setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path) return vim.fn.getcwd() end,
    }),
  }
})
