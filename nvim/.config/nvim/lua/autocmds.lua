require "nvchad.autocmds"

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if ok then
      api.tree.reload()
    end
  end,
  desc = "Refresh nvim-tree (including git status) on focus/terminal events",
})
