local ok, nvim_comment = pcall(require, "nvim_comment")

if not ok then
  print("ccc not installed, run PackerSync")
  do return end
end

nvim_comment.setup({
  comment_empty = false,
})
