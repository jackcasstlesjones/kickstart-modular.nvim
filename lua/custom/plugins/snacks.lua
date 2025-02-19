return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      animate = { enabled = true },
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      lazygit = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<leader>g',
        function()
          Snacks.lazygit()
        end,
        desc = 'LazyGit',
      },
    },
  },
}
