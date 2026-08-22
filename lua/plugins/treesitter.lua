return {
	{
		"nvim-treesitter/nvim-treesitter",

		lazy = false,

		build = ":TSUpdate",

		config = function()
			local ts = require("nvim-treesitter")

			-- 安装 Lua parser
			ts.install({
				"lua",
				"c",
				"cpp",
				"python",
			})

			-- 对 Lua 文件启用 Treesitter 高亮
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"lua",
					"c",
					"cpp",
					"python",
				},

				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
