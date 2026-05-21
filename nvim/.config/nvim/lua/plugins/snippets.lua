return {
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "jsx",
      "tsx",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Syntax
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
}
