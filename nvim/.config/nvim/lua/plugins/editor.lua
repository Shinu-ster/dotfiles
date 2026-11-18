return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "python",
      },
      highlight = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    config = function()
      require('treesitter-context').setup({
        enable = true,
        max_lines = 3,
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("harpoon").setup()
    end,

    keys = {
      -- add file
      {
        "<leader>aa",
        function() require("harpoon"):list():add() end,
        desc = "Harpoon add file",
      },

      -- toggle menu
      {
        "<leader>hh",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon menu",
      },

      -- navigation
      {
        "<leader>q1",
        function() require("harpoon"):list():select(1) end,
        desc = "Harpoon file 1",
      },
      {
        "<leader>q2",
        function() require("harpoon"):list():select(2) end,
        desc = "Harpoon file 2",
      },
      {
        "<leader>q3",
        function() require("harpoon"):list():select(3) end,
        desc = "Harpoon file 3",
      },
      {
        "<leader>q4",
        function() require("harpoon"):list():select(4) end,
        desc = "Harpoon file 4",
      },
    }
  },
  {
    "jiaoshijie/undotree",
    opts = {
      -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", desc = "Undo Tree", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "ThePrimeagen/vim-be-good", cmd = "VimBeGood",
  },
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      startVisible = true,
      -- debounceMs = 0,
      showBlankVirtLine = true,
      -- highlightFullVirtLine = false,
      highlightColor = { link = "Comment" },
      -- targetedMotionHighlightColor = { link = "PrecognitionTargetedMotionDefault" },
      -- textObjectHighlightColors = {
      --     { link = "DiffText" },
      --     { link = "DiffChange" },
      --     { link = "Visual" },
      -- },
      targetedMotionHints = {
          enabled = false,
          prio = 1,
      },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
      -- disabled_fts = {
      --     "startify",
      -- },
    },
  },
}
