  return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },


    config = function ()
      require('neo-tree').setup {
          auto_close = true,
          update_cwd = true,
          view = {
              mappings = {
                custom_only = true,
                list = {
                      { key = "<leader>n", cb = require('neo-tree.sources.manager').show },
                      { key = "<leader>nf", cb = require('neo-tree').find_file }
                }
              }
          }
      }
    end,
}
