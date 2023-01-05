local ok, wk = pcall(require, "which-key")

if not ok then
  print("whick-key not installed, run PackerSync")
  do return end
end

wk.setup({
  operators = { gc = "Comments", ys = "Surround", yS = "Surround" },
  window = { winblend = 30 },
})
