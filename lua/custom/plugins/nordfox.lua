return {
  'EdenEast/nightfox.nvim',
  enabled = true,
  priority = 1000, -- Ensures the colorscheme loads early
  config = function()
    require('nightfox').setup {
      options = {
        transparent = false, -- Enable transparency
        terminal_colors = true, -- Set terminal colors
        dim_inactive = false, -- Keep inactive panes the same
        styles = {
          comments = 'NONE',
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'NONE',
          variables = 'NONE',
        },
      },
    }

    -- Set the colorscheme
    vim.cmd 'colorscheme nordfox'
  end,
}
