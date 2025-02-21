return {
  {
    'akinsho/toggleterm.nvim',
    enabled = true,
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
    end,
    keys = {
      { '<leader>tf', ':ToggleTerm<CR>', desc = 'Toggle terminal' }, -- Generic toggle
    },
  },
}
