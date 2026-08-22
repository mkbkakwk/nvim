return {
	{
		"folke/lazydev.nvim",

		ft = "lua",

		opts = {
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},

	{
		"saghen/blink.cmp",

		version = "1.*",

		opts = {
			keymap = {
				preset = "default",
			},

			completion = {
				documentation = {
					auto_show = false,
				},
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"buffer",
				},

				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust",
			},
		},

		opts_extend = {
			"sources.default",
		},
	},
}
