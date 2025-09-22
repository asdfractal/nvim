return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    -- cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    opts = {
      -- LazyVim config for treesitter
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    config = function(_, opts)
      local TS = require "nvim-treesitter"
      TS.setup(opts)
      local install = vim.tbl_filter(function(lang)
        return vim.treesitter.language.get_lang(lang) ~= nil
      end, opts.ensure_installed or {})
      if #install > 0 then
        TS.install(install, { summary = true })
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if vim.treesitter.language.get_lang(ev.match) ~= nil then
            pcall(vim.treesitter.start)
          end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },
}
