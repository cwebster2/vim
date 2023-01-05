local ok, hydra = pcall(require, "hydra")

if not ok then
  print("Hydra not installed")
  do return end
end

hydra({
  name = "Window Ops",
  mode = "n",
  -- config = {},
  body = "<C-w>",
  heads = {
    -- move
    {"m", "<C-w>h"},
    {"n", "<C-w>j"},
    {"e", "<C-w>k"},
    {"i", "<C-w>l"},
  },
})
