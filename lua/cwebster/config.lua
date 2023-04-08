local M = {}

local config = {}

local default_config = {
	tui = true,
}

function M.setup(new_opts)
	config = vim.tbl_deep_extend("force", default_config, config, new_opts or {})
end

function M.get_config()
	return config
end

return M
