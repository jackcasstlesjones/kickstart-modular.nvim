-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  config = function()
    vim.cmd 'Markview Enable'
  end,
  keys = {
    { '<leader>tm', ':Markview Toggle<CR>', desc = 'Toggle Markview' },
  },
}
