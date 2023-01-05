local ok, wk = pcall(require, "which-key")

if not ok then
  print("whick-key not installed, run PackerSync")
  do return end
end

wk.setup({
  operators = { gc = "Comments", ys = "Surround", yS = "Surround" },
  window = { winblend = 30 },
})

wk.register({
  ["g"] = {
    name = "+git",
    ["h"] = { name = "+hunks" }
  },
  ["b"] = { name = "+buffer" },
  ["h"] = {
    name = "+help",
    ["p"] = { name = "+packer" }
  },
  ["f"] = { name = "+find" },
  ["s"] = { name = "+search" },
  ["x"] = { name = "+trouble" },
  ["t"] = { name = "+testing" },
  ["d"] = { name = "+debug" },
},{
  prefix = "<leader>"
})

wk.register({
  ["g"] = {
    name = "+goto",
    ["z"] = {
      name = "+zettle",
      n = { "New" },
      z = { "Find/create" },
      Z = { "Insert ID" },
      b = { "Backlinks" },
      B = { "Id of backlink" },
      t = { "Find/insert tags" },
      s = { "Start server" },
      ["]"] = { "Next Link" },
      ["["] = { "Prev Link" },
    },
  },
})

