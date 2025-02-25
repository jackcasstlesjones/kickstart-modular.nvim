-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  config = function()
    local presets = require 'markview.presets'

    require('markview').setup {
      markdown = {
        headings = presets.headings.marker,
      },
      renderers = {
        -- Custom renderer for markdown list items (bullet points)
        markdown_list_item = function(ns, buffer, item)
          -- Empty renderer to effectively disable bullet points
          -- By providing a custom renderer that does nothing,
          -- we prevent the default rendering of bullet points
        end,
      },
    }
    vim.cmd 'Markview Enable'
  end,
  keys = {
    { '<leader>tm', ':Markview Toggle<CR>', desc = 'Toggle Markview' },
  },
}
