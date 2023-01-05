local ok, surround = pcall(require, "nvim-surround")

if not ok then
  print("ccc not installed, run PackerSync")
  do return end
end

surround.setup({})
