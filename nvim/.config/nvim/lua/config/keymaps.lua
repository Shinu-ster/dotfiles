-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Git signs mappings
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })

map("n", "]c", function()
  require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })

map("n", "[c", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })

-- Git diff (what you actually want)
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Git diff this file" })

map("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })

map("n", "<leader>ld", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazydocker = Terminal:new({
    cmd = "lazydocker",
    direction = "float",
    hidden = true,
  })
  lazydocker:toggle()
end, { desc = "LazyDocker" })

map("n", "<leader>lg", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazydocker = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  })
  lazydocker:toggle()
end, { desc = "LazyGit" })
