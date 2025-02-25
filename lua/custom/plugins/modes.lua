return {
  'mvllow/modes.nvim',
  config = function()
    require('modes').setup {
      colors = {
        bg = '', -- Optional bg param, defaults to Normal hl group
        copy = '#ffc100',
        delete = '#c75c6a',
        insert = '#5e81ac',
        visual = '#d08770',
      },

      -- Set opacity for cursorline and number background
      line_opacity = 0.5,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      set_number = false,

      -- Disable modes highlights in specified filetypes
      -- Please PR commonly ignored filetypes
      ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
    }
  end,
}
