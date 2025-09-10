return {
	"eandrju/cellular-automaton.nvim",

	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
		config = function()
			require("colorizer").setup({
				filetypes = {
					"*",
				},
				user_default_options = {
					names = false,
					css_fn = true,
					css = true,
				},
			})
		end,
	},

	{
		-- "asdfractal/oceanic-next-vim",
		"mhartington/oceanic-next",
		-- "oceanicnext",
		-- name = "oceanicnext",
		--     dir = "~/projects/oceanic-next-vim/",
		config = function()
			vim.g.oceanic_transparent_bg = 0
			vim.cmd.colorscheme("OceanicNext")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		end,
	},
}
