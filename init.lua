vim.g.mapleader = " "
require "globals"
require "options"
require "keymap"
require "autocmd"

local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match "position_encoding param is required"
      or msg:match "Defaulting to position encoding of the first client"
      or msg:match "multiple different client offset_encodings"
    )
  then
    return
  end
  return notify_original(msg, ...)
end

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom/plugins" }, {
  change_detection = {
    notify = false,
  },
})
