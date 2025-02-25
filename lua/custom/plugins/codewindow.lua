return {
  {
    'gorbit99/codewindow.nvim',
    enabled = false,
    config = function()
      local codewindow = require 'codewindow'
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },
}
