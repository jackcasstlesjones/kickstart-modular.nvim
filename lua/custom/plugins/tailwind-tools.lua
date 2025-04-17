-- tailwind-tools.lua
return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },
  keys = {
    { '<leader>tws', '<cmd>TailwindSort<cr>', desc = 'Tailwind Sort' },
    -- { '<C-j>', '<cmd>TailwindNextClass<cr>', desc = 'Next Tailwind Class' },
    -- { '<C-k>', '<cmd>TailwindPrevClass<cr>', desc = 'Previous Tailwind Class' },
  },
  opts = {}, -- your configuration
}
