return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      -- require("mini.files").setup()

      -- local hipatterns = require "mini.hipatterns"
      -- hipatterns.setup {
      --   highlighters = {
      --     hex_color = hipatterns.gen_highlighter.hex_color(),
      --   },
      -- }
    end,
  },
}
