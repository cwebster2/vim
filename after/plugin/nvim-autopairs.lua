local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then
  print("nvim-autopairs not installed, run PackerSync")
  do return end
end

autopairs.setup()
