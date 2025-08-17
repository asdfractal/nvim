return {
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
		},
		cmd = { "AdvancedGitSearch" },
		config = function()
			---@type advanced_git_search.Config
			local config = {
				browse_command = "GBrowse",
				-- git_flags = { "-c", "delta.side-by-side=false" },
				git_diff_flags = {},
				show_builtin_git_pickers = true,
				diff_plugin = "diffview",
				entry_default_author_or_date = "author",
			}

			---@type "fzf" | "telescope"
			local ags_type = "fzf"

			if ags_type == "fzf" then
				require("advanced_git_search.fzf").setup(config)
			else
				require("telescope").setup({
					extensions = {
						advanced_git_search = config,
					},
				})
				require("telescope").load_extension("advanced_git_search")
			end
		end,
	},
	-- TODO
	-- {
	--     "tpope/vim-fugitive",
	--     config = function()
	--         vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	--
	--         local asdfractal_Fugitive = vim.api.nvim_create_augroup("asdfractal_Fugitive", {})
	--
	--         local autocmd = vim.api.nvim_create_autocmd
	--         autocmd("BufWinEnter", {
	--             group = asdfractal_Fugitive,
	--             pattern = "*",
	--             callback = function()
	--                 if vim.bo.ft ~= "fugitive" then
	--                     return
	--                 end
	--
	--                 local bufnr = vim.api.nvim_get_current_buf()
	--                 local opts = { buffer = bufnr, remap = false }
	--                 vim.keymap.set("n", "<leader>p", function()
	--                     vim.cmd.Git("push")
	--                 end, opts)
	--
	--                 -- rebase always
	--                 vim.keymap.set("n", "<leader>P", function()
	--                     vim.cmd.Git({ "pull", "--rebase" })
	--                 end, opts)
	--
	--                 -- NOTE: It allows me to easily set the branch i am pushing and any tracking
	--                 -- needed if i did not set the branch up correctly
	--                 vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	--             end,
	--         })
	--
	--         vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
	--         vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
	--     end,
	-- },

	"airblade/vim-gitgutter",
	-- "sindrets/diffview.nvim",
	-- "kdheepak/lazygit.nvim",
}
