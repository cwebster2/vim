local ok, neogit = pcall(require, "neogit")

if not ok then
  print("neogit not installed, run PackerSync")
  do return end
end

neogit.setup({
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = true,
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true,
  },
  -- mappings = {},
})

