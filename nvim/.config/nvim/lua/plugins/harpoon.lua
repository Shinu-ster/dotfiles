return
   {
     "ThePrimeagen/harpoon",
     branch = "harpoon2",
     dependencies = {"nvim-lua/plenary.nvim"},

     config = function ()
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
         function ()
           require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
         end,
         desc = "Harpoon menu",
       },

       -- navigation
       {
         "<leader>q1",
         function () require("harpoon"):list():select(1) end,
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
   }
