return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},

		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"basedpyright",
			},

			automatic_enable = true,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		dependencies = {
			"mason-org/mason.nvim",
		},

		opts = {
			ensure_installed = {
				"stylua",
				"clang-format",
				"ruff",
			},

			run_on_start = true,
			auto_update = false,
		},
	},
}
