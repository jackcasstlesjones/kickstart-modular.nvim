return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian/jacks-vault',
      },
    },

    -- Optional UI configuration
    ui = {
      enable = false, -- enable additional UI features
    },
  },
}
