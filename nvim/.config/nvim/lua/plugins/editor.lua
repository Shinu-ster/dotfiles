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
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
}
