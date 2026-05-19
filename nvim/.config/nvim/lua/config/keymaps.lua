require "nvchad.mappings"

local map = vim.keymap.set
map("n", "n", "n", { noremap = true, desc = "Next search result" })
map("n", "N", "N", { noremap = true, desc = "Prev search result" })

map("i", "jk", "<ESC>")

-- Switch buffers with Tab / Shift+Tab
map("n", "<Tab>", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd("tabnext")
  else
    vim.cmd("bnext")
  end
end, { desc = "Next buffer or tab in diffview" })

map("n", "<S-Tab>", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd("tabprev")
  else
    vim.cmd("bprevious")
  end
end, { desc = "Prev buffer or tab in diffview" })

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


map("n", "<leader>lp", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazydocker = Terminal:new({
    cmd = "posting",
    direction = "float",
    hidden = true,
  })
  lazydocker:toggle()
end, { desc = "Posting" })

-- Toggle fold under cursor (Using UFO instead of standard 'za')
map("n", "<leader>z", function()
  local winid = vim.api.nvim_get_current_win()
  if not require("ufo").toggleFoldWithCount() then
    vim.cmd("normal! za")
  end
end, { desc = "Toggle fold" })

-- Peek inside a fold without opening it!
map("n", "<leader>fp", function()
  local winid = vim.api.nvim_get_current_win()
  local row = vim.api.nvim_win_get_cursor(winid)[1]
  -- If the line is folded, this opens a floating window showing the contents
  require("ufo").peekFoldedLinesUnderCursor()
end, { desc = "Peek fold content" })

-- Close/Fold current block (Smart fallback)
map("n", "<leader>fc", "zc", { desc = "Fold current block" })

-- Open fold under cursor
map("n", "<leader>fo", "zo", { desc = "Open fold" })

-- Fold everything
map("n", "<leader>fa", function() require("ufo").closeAllFolds() end, { desc = "Fold all" })

-- Unfold everything
map("n", "<leader>ua", function() require("ufo").openAllFolds() end, { desc = "Unfold all" })
