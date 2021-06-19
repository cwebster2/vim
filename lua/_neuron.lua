local M = {}

function M.setup()
  require'neuron'.setup {
      virtual_titles = true,
      mappings = true,
      run = nil, -- function to run when in neuron dir
      neuron_dir = "~/zettle",
      leader = "gz", --the leader key to for all mappings, remember with 'go zettel'
  }
end

return M
