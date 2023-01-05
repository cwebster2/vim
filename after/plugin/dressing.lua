local ok, dressing = pcall(require, "dressing")

if not ok then
  print("dressing not installed, run PackerSync")
  do return end
end

dressing.setup({})
