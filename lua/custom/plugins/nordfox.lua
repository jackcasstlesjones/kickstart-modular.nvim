return {
  'EdenEast/nightfox.nvim',
  enabled = true,
  priority = 1000, -- Ensures the colorscheme loads early
  config = function()
    -- Define specs (including git changes)
    local specs = {
      all = {
        git = {
          add = '',
          removed = '',
          changed = '',
          conflict = '',
          ignored = '',
        },
      },
    }

    -- Set up nightfox with the custom specs
    require('nightfox').setup {
      specs = specs, -- Pass the custom specs here

      options = {
        transparent = true, -- Enable transparency
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

    -- Set the colorscheme to nordfox (or any other theme you want)
    vim.cmd 'colorscheme nordfox'
  end,
}
