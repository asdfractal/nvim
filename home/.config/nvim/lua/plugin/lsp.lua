return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
		config = function()
			require("lazydev").setup()
		end,
	},

	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
		event = "VeryLazy",
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("config.lsp-config")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		-- event = "BufReadPre",
	},

	{
		"j-hui/fidget.nvim",
		opts = {},
		event = "BufReadPre",
		config = function()
			require("fidget").setup({})
		end,
	},
}
