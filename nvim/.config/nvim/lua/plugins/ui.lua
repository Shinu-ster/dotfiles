return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = { "Function", "Label" },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      popupmenu = {
        enabled = true,
        backend = "cmp",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true, -- this is the key one - puts cmp below cmdline
        long_message_to_split = true,
      },
      views = {
        cmdline_popup = {
          position = { row = "50%", col = "50%" },
          size = { width = 60, height = "auto" },
        },
        popupmenu = {
          relative = "editor",
          position = { row = "57%", col = "50%" },
          size = { width = 60, height = 10 },
          border = { style = "rounded", padding = { 0, 1 } },
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact", -- compact, default, minimal, simple
      stages = "fade",    -- animation: fade, slide, fade_in_slide_out, static
      timeout = 3000,
      max_width = 40,
      max_height = 5,
      top_down = true,
    },
  },
}
