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
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  })
  lazygit :toggle()
end, { desc = "LazyGit" })


map("n", "<leader>lp", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local posting = Terminal:new({
    cmd = "posting",
    direction = "float",
    hidden = true,
  })
  posting:toggle()
end, { desc = "Posting" })

--folding
map("n", "<leader>zc", "zc", { desc = "Fold current block" })
map("n", "<leader>zo", "zo", { desc = "Open fold" })
map("n", "<leader>za", "za", { desc = "Toggle fold" })
map("n", "<leader>zM", "zM", { desc = "Fold all" })
map("n", "<leader>zR", "zR", { desc = "Unfold all" })
map("n", "<leader>zj", "zj", { desc = "Next fold" })
map("n", "<leader>zk", "zk", { desc = "Prev fold" })
-- peeking folded contents
map("n", "<leader>zp", function()
  local start = vim.fn.foldclosed(".")
  local end_ = vim.fn.foldclosedend(".")
  if start == -1 then
    vim.notify("No fold under cursor", vim.log.levels.INFO)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, start - 1, end_, false)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = vim.bo.filetype

  local width = math.floor(vim.o.columns * 0.7)
  local height = math.min(#lines, 20)

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })

  -- Press q or <Esc> to close
  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })

  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })

  -- Focus the window so you can scroll inside it
  vim.api.nvim_set_current_win(win)
end, { desc = "Peek fold content" })
