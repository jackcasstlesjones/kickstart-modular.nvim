return {
  {
    'nvim-telescope/telescope-frecency.nvim',
    enabled = false,
    version = '*',
    dependencies = { 'kkharji/sqlite.lua' }, -- Ensure the required dependency is installed
    config = function()
      local telescope = require 'telescope'
      telescope.load_extension 'frecency'

      -- Keymap to search all files with recency prioritization
      vim.keymap.set('n', '<leader><leader>', function()
        telescope.extensions.frecency.frecency { workspace = 'CWD' } -- Change to "global" if preferred
      end, { desc = '[S]earch [F]iles with Frecency' })
    end,
  },
}
