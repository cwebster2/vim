return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("cwebster.dap").setup()
		end,
	},
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
}
