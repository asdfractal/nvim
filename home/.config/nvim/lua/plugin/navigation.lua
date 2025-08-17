return {
	-- "smoka7/hop.nvim"
	{
		"ibhagwan/fzf-lua",
		enabled = false,
		-- event = "BufReadPre",
		config = function()
			require("fzf-lua").setup({
				"telescope",
				devicons = {
					enable = true,
				},
				hls = {
					border = "Normal",
				},
				fzf_layout = "default",
			})

			-- Search shortcuts
			vim.api.nvim_set_keymap("n", "<leader>ff", ":FzfLua files<CR>", { noremap = true, silent = true })

			-- https://github.com/aaronhallaert/dotfiles/blob/591a42e1e6ae40ab2214088d1aab4f87ab0b1c77/nvim/.config/nvim/lua/plugins/navigation.lua
			-- vim.keymap.set("n", "<leader>fg", function()
			--     require("fzf-lua").live_grep({
			--         cmd = require("aaron.utils.search").rg_gitwords(),
			--     })
			-- end)
			-- vim.keymap.set("n", "<leader>fng", function()
			--     require("fzf-lua").live_grep({
			--         cmd = require("aaron.utils.search").rg_gitwords({
			--             hidden = true,
			--             ignore = true,
			--         }),
			--     })
			-- end)
			-- vim.keymap.set("n", "fiw", function()
			--     require("fzf-lua").grep_cword({
			--         cmd = require("aaron.utils.search").rg_gitwords({
			--             hidden = false,
			--         }),
			--     })
			-- end)
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},
	-- "junegunn/fzf.vim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzy-native.nvim", lazy = false },
			-- {
			-- 	"nvim-telescope/telescope-fzf-native.nvim",
			-- 	build = "make",
			-- 	cond = function()
			-- 		return vim.fn.executable("make") == 1
			-- 	end,
			-- },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},

		config = function()
			require("config.telescope.setup")
			-- require("telescope").setup({
			-- 	defaults = {
			-- 		file_sorter = require("telescope.sorters").get_fzy_sorter,
			-- 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			-- 		file_ignore_patterns = { "node_modules", "packer_compiled", "%.git" },
			-- 		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			-- 		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			-- 		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			-- 	},
			-- 	extensions = {
			-- 		-- fzf = {
			-- 		-- 	fuzzy = true, -- false will only do exact matching
			-- 		-- 	override_generic_sorter = true, -- override the generic sorter
			-- 		-- 	override_file_sorter = true, -- override the file sorter
			-- 		-- 	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- 		-- 	-- the default case_mode is "smart_case"
			-- 		-- },
			-- 		fzy_native = {
			-- 			override_generic_sorter = false,
			-- 			override_file_sorter = true,
			-- 		},
			-- 		advanced_git_search = {
			-- 			-- Fugitive or diffview
			-- 			diff_plugin = "fugitive",
			-- 			-- Customize git in previewer
			-- 			-- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
			-- 			git_flags = {},
			-- 			-- Customize git diff in previewer
			-- 			-- e.g. flags such as { "--raw" }
			-- 			git_diff_flags = {},
			-- 			-- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
			-- 			show_builtin_git_pickers = false,
			-- 		},
			-- 		["ui-select"] = {
			-- 			require("telescope.themes").get_dropdown(),
			-- 		},
			-- 		pickers = {
			-- 			find_files = {
			-- 				hidden = true,
			-- 			},
			-- 			live_grep = {
			-- 				additional_args = function()
			-- 					return {
			-- 						"--max-depth=99",
			-- 					}
			-- 				end,
			-- 			},
			-- 			buffers = {
			-- 				sort_lastused = true,
			-- 				mappings = {
			-- 					i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
			-- 					n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })
			-- -- pcall(require("telescope").load_extension, "fzf")
			-- pcall(require("telescope").load_extension, "fzy_native")
			-- pcall(require("telescope").load_extension, "ui-select")
			--
			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "[S]earch [H]elp" })
			-- vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			-- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			-- vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
			-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
			-- vim.keymap.set("n", "<leader>pa", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			-- vim.keymap.set("n", "<leader>pws", function()
			-- 	local word = vim.fn.expand("<cword>")
			-- 	builtin.grep_string({ search = word })
			-- end)
			-- vim.keymap.set("n", "<leader>pWs", function()
			-- 	local word = vim.fn.expand("<cWORD>")
			-- 	builtin.grep_string({ search = word })
			-- end)
			--
			-- vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "List buffers" })
			-- vim.keymap.set("n", "<leader>pq", builtin.quickfix, { desc = "List quickfix" })
		end,
	},

	"wsdjeg/vim-fetch", -- jump to line:col file format
	{
		"Aasim-A/scrollEOF.nvim",
		config = function()
			require("scrollEOF").setup()
		end,
	},
}
