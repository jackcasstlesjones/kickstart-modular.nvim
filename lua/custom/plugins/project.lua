return {
  {
    'ahmedkhalf/project.nvim',
    enabled = false,
    config = function()
      require('project_nvim').setup {
        -- Manual mode doesn't automatically change your root directory
        manual_mode = false,

        -- Root detection methods
        detection_methods = { 'lsp', 'pattern' },

        -- Patterns used to detect the root directory
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },

        -- Ignore specific LSP clients
        ignore_lsp = {},

        -- Exclude certain directories
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- Suppress directory change messages
        silent_chdir = true,

        -- Scope of directory change
        scope_chdir = 'global',

        -- Path to store project history
        datapath = vim.fn.stdpath 'data',
      }
    end,
  },

  -- Load telescope extension
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   config = function()
  --     require('telescope').load_extension 'projects'
  --     vim.keymap.set('n', '<leader>p', function()
  --       require('telescope').extensions.projects.projects()
  --     end, { desc = 'Open Project Picker' })
  --   end,
  -- },
}
