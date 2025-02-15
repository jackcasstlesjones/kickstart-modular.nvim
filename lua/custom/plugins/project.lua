return {

  {
    'ahmedkhalf/project.nvim',
    enabled = false,
    config = function()
      require('project_nvim').setup() -- No arguments, uses defaults

      -- Load telescope extension
      require('telescope').load_extension 'projects'
      vim.keymap.set('n', '<leader>p', function()
        require('telescope').extensions.projects.projects()
      end, { desc = 'Open Project Picker' })
    end,
  },
}
