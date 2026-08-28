return {
	{
		"stevearc/conform.nvim",

		event = {
			"BufWritePre",
		},

		cmd = {
			"ConformInfo",
		},

		keys = {
			{
				"<leader>f",

				function()
					require("conform").format({
						async = true,
						lsp_format = "fallback",
					})
				end,

				mode = { "n", "v" },
				desc = "Format",
			},
		},

		opts = {
			formatters_by_ft = {
				lua = {
					"stylua",
				},
				c = {
					"clang_format",
				},
				cpp = {
					"clang_format",
				},
				python = {
					"ruff_format",
				},
				javascript = {
					"prettier",
				},
				yaml = {
					"prettier",
				},
				astro = {
					"prettier",
				},
			},

			formatters = {
				clang_format = {
					prepend_args = {
						"--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWidth: 8, UseTab: ForIndentation}",
					},
				},
			},

			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = {
				timeout_ms = 500,
			},
		},
	},
}
