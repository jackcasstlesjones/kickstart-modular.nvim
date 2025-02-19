return {
  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = true,
    main = 'ibl',
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    config = function()
      local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      }

      local hooks = require 'ibl.hooks'

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD', underline = false })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2', underline = false })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      require('ibl').setup {
        scope = {
          highlight = highlight,
          show_start = true,
          show_end = true,
        },
        indent = {
          -- Here are some different characters you can try:
          -- char = "▎", -- Thicker line
          char = '│', -- Thin line
          -- char = "⎸", -- Very thin line
          -- char = "▏", -- Slightly thinner than ▎
          -- char = '▎', -- Choose the one you prefer
        },

        whitespace = { remove_blankline_trail = false },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
