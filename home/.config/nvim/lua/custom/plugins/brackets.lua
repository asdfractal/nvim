return {
  -- {
  --   "windwp/nvim-autopairs",
  --   event = "InsertEnter",
  --   config = true,
  --   opts = {
  --     enable_moveright = false,
  --   },
  --
  --   -- Optional dependency
  --   -- config = function()
  --   -- 	require("nvim-autopairs").setup({
  --   -- 	})
  --   -- 	-- If you want to automatically add `(` after selecting a function or method
  --   -- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  --   -- 	local cmp = require("cmp")
  --   -- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  --   -- end,
  -- },

  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },

  -- "numToStr/Comment.nvim",
  -- "tpope/vim-surround",
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup {
        indent = {
          enable = true,
          style = "#15151e",
        },
        blank = {
          enable = false,
        },
        line_num = {
          enable = true,
          style = "#d279d2",
          use_treesitter = true,
        },
        chunk = {
          enable = false,
          use_treesitter = true,
          delay = 0,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#806d9c",
        },
      }
    end,
  },

  -- {
  --   "andymass/vim-matchup",
  --   init = function()
  --     require("match-up").setup {
  --       treesitter = {
  --         stopline = 500,
  --       },
  --     }
  --   end,
  -- },

  -- {
  --   "chrisgrieser/nvim-spider",
  --   init = function()
  --     vim.keymap.set({ "n", "o", "x" }, "w", function()
  --       require("spider").motion "w"
  --     end, { desc = "Spider-w" })
  --     vim.keymap.set({ "n", "o", "x" }, "e", function()
  --       require("spider").motion "e"
  --     end, { desc = "Spider-e" })
  --     vim.keymap.set({ "n", "o", "x" }, "b", function()
  --       require("spider").motion "b"
  --     end, { desc = "Spider-b" })
  --     vim.keymap.set({ "n", "o", "x" }, "ge", function()
  --       require("spider").motion "ge"
  --     end, { desc = "Spider-ge" })
  --   end,
  -- },
}
