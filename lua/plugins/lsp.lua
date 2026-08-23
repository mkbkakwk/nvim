return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
			"b0o/schemastore.nvim",
		},

		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						format = {
							enable = false,
						},

						schemaStore = {
							enable = false,
							url = "",
						},

						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("yamlls")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = {
						buffer = event.buf,
						silent = true,
					}

					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, {
							desc = "Go to definition",
						})
					)

					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, {
							desc = "Go to declaration",
						})
					)
				end,
			})
		end,
	},
}
