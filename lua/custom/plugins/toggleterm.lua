return {
  {
    'akinsho/toggleterm.nvim',
    enabled = false,
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        float_opts = {
          border = 'curved',
          width = 100,
          height = 30,
        },
      }
      -- Add terminal mode escape binding
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
    end,
    keys = {
      { '<leader>tf', ':ToggleTerm direction=float<CR>', desc = 'Toggle floating terminal' },
    },
  },
}
