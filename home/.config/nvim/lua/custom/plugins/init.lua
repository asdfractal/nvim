return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
    lazy = false,
  },
  {
    "mbbill/undotree",

    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
}
