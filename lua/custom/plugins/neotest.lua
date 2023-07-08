return
{
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "olimorris/neotest-phpunit",
    "marilari88/neotest-vitest",
    "theutz/neotest-pest",
  },
  keys = {
    { "<leader>ts",  function() require('neotest').summary.toggle() end },
    { "<leader>to",  function() require('neotest').output.open({ enter = true }) end },
    { "<leader>tr",  function() require('neotest').run.run() end },
    { "<leader>trs", function() require('neotest').run.run({ suite = true }) end },
    { "<leader>top", function() require('neotest').output_panel.toggle() end },
    { "<leader>tf",  function() require("neotest").run.run(vim.fn.expand("%")) end },
    { "[n",          function() require("neotest").jump.prev({ status = "failed" }) end },
    { "]n",          function() require("neotest").jump.next({ status = "failed" }) end },

  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit"),
        require("neotest-vitest"),
        require("neotest-pest")
      },
    })

    require("neotest-phpunit")({
      filter_dirs = { "vendor" }
    })
  end
}
