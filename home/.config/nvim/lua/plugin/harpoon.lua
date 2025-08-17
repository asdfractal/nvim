return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>A", function()
				harpoon:list():prepend()
			end)
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>6", function()
				harpoon:list():select(6)
			end)
			vim.keymap.set("n", "<C-q>", function()
				harpoon:list():next()
			end)
			vim.keymap.set("n", "<C-w>", function()
				harpoon:list():prev()
			end)
			-- vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
			-- vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
			-- vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
			-- vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
		end,
	},
}
