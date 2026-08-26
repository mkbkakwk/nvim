return {
	"nvim-mini/mini.pick",
	version = "*",

	config = function()
		require("mini.pick").setup()

		vim.keymap.set("n", "<leader>ff", function()
			MiniPick.builtin.files()
		end, { desc = "Find files" })

		vim.keymap.set("n", "<leader>fb", function()
			MiniPick.builtin.buffers()
		end, { desc = "Find buffers" })
	end,
}
