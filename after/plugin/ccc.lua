local ok, ccc = pcall(require, "ccc")

if not ok then
  print("ccc not installed, run PackerSync")
  do return end
end

ccc.setup({
  highlighter = {
    auto_enable = true
  }
})
