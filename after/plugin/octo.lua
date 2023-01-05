local ok, octo = pcall(require, "octo")

if not ok then
  print("ccc not installed, run PackerSync")
  do return end
end

octo.setup()
