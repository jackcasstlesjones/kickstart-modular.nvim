return {
  {
    'ptdewey/yankbank-nvim',
    dependencies = 'kkharji/sqlite.lua',
    config = function()
      require('yankbank').setup {

        sep = '#######################################',
        persist_type = 'sqlite',

        vim.keymap.set('n', '<leader>p', '<cmd>YankBank<CR>', { noremap = true }),
      }
    end,
  },
}
