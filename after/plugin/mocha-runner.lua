local ok, mocha_runner = pcall(require, "mocha-runner")

if not ok then
  print("mocha-runner not installed, run PackerSync")
  do return end
end

mocha_runner.setup({})
