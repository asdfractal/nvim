require("telescope").setup {
  extensions = {
    wrap_results = true,

    fzf = {},
    history = {
      limit = 100,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pp", function()
  return builtin.git_files {}
end)

vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>pa", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>pws", function()
  local word = vim.fn.expand "<cword>"
  builtin.grep_string { search = word }
end)
vim.keymap.set("n", "<leader>pWs", function()
  local word = vim.fn.expand "<cWORD>"
  builtin.grep_string { search = word }
end)

vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>pq", builtin.quickfix, { desc = "List quickfix" })

vim.keymap.set("n", "<space>fg", require "custom.telescope.multi-ripgrep")
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<space>fa", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
end)

vim.keymap.set("n", "<space>en", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)
