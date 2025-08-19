return {
  "airblade/vim-gitgutter",
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen" },
    init = function()
      vim.keymap.set({ "n" }, "<leader>gc", "<cmd>DiffviewFileHistory %<CR>", { desc = "diffview buffer commits" })
      vim.keymap.set({ "n" }, "<leader>gs", function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd.DiffviewOpen()
        else
          if vim.fn.tabpagenr "$" > 1 then
            vim.cmd.DiffviewClose()
          else
            vim.cmd.quitall()
          end
        end
      end, { desc = "toggle diffview git status" })
    end,
    config = function()
      require "custom.diffview"
    end,
  },
}
