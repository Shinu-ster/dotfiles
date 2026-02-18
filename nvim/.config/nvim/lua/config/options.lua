-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require "nvchad.options"

vim.diagnostic.config({
  virtual_text = false, -- keep float-only diagnostics
  underline = true,     -- underline the error
  signs = true,         -- show sign column markers
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "rounded",
    max_width = 80,
    wrap = true,
  },
})
-- add yours here!
local o = vim.opt
o.relativenumber = true
o.wrap = true
o.breakindent = true
o.linebreak = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
