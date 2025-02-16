return {
  {
    'jvgrootveld/telescope-zoxide',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'zoxide'

      -- Basic setup with default settings
      require('telescope').setup {
        extensions = {
          zoxide = {
            prompt_title = '[ Zoxide List ]',
            mappings = {
              default = {
                after_action = function(selection)
                  print('Update to (' .. selection.z_score .. ') ' .. selection.path)
                end,
              },
            },
          },
        },
      }
    end,
  },
}
