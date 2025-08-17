local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		sorting_strategy = "descending",
		selection_strategy = "reset",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.55,
				results_width = 0.6,
			},
			vertical = { mirror = false },
			width = 0.8,
			height = 0.80,
			preview_cutoff = 120,
		},
		-- prompt_prefix = "> ",
		-- selection_caret = "  ",
		-- entry_prefix = "  ",
		vimgrep_arguments = {
			"rg",
			"--hidden",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		initial_mode = "insert",
		file_ignore_patterns = { "node_modules", "packer_compiled", "%.git" },
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		-- squared borders
		borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		mappings = {
			i = {
				["<c-e>"] = function(prompt_bufnr)
					require("telescope.actions").select_default(prompt_bufnr)
					require("telescope.builtin").resume()
				end,
				["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
				["<C-g>"] = require("telescope.actions").to_fuzzy_refine,
			},
			n = {
				["<c-e>"] = function(prompt_bufnr)
					require("telescope.actions").select_default(prompt_bufnr)
					require("telescope.builtin").resume()
				end,
				["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		advanced_git_search = {
			-- Fugitive or diffview
			diff_plugin = "fugitive",
			-- Customize git in previewer
			-- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
			git_flags = {},
			-- Customize git diff in previewer
			-- e.g. flags such as { "--raw" }
			git_diff_flags = {},
			-- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
			show_builtin_git_pickers = false,
		},
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			mappings = {
				i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
				n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
			},
		},
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = function()
				return {
					"--max-depth=99",
				}
			end,
		},
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>pa", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>pws", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set("n", "<leader>pWs", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)

vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>pq", builtin.quickfix, { desc = "List quickfix" })

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")
