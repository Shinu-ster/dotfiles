return {
  -- git
  {
    'isakbm/gitgraph.nvim',
    dependencies = { 'sindrets/diffview.nvim' },
    opts = {
      git_cmd = "git",
      symbols = {
        merge_commit = '',
        commit = '',
        merge_commit_end = '',
        commit_end = '',

        -- Advanced symbols
        GVER = '',
        GHOR = '',
        GCLD = '',
        GCRD = '╭',
        GCLU = '',
        GCRU = '',
        GLRU = '',
        GLRD = '',
        GLUD = '',
        GRUD = '',
        GFORKU = '',
        GFORKD = '',
        GRUDCD = '',
        GRUDCU = '',
        GLUDCD = '',
        GLUDCU = '',
        GLRDCL = '',
        GLRDCR = '',
        GLRUCL = '',
        GLRUCR = '',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.cmd('DiffviewOpen ' .. commit.hash .. '^!')
        end,
        on_select_range_commit = function(from, to)
          vim.cmd('DiffviewOpen ' .. to.hash .. '^..' .. from.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
      {
        "<CR>",
        function()
          require('gitgraph').select()
        end,
        desc = "GitGraph - Select commit",
        ft = "gitgraph", -- only active in gitgraph buffer
      },
    },
  },
  -- git
  {
    'sindrets/diffview.nvim',
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
    keys = {
      {
        "<leader>gm",
        "<cmd>DiffviewOpen<cr>",
        desc = "Git - Open merge tool",
      },
      {
        "<leader>gc",
        "<cmd>DiffviewClose<cr>",
        desc = "Git - Close merge tool",
      },
      {
        "<leader>gf",
        "<cmd>DiffviewToggleFiles %<cr>",
        desc = "Git - Show File History",
      },
      {
        "<leader>gr",
        "<cmd>!git rebase --continue<cr>",
        desc = "Git - Rebase continue",
      },
      { "n", "<tab>",   false },
      { "n", "<s-tab>", false },
    }
  },

}
