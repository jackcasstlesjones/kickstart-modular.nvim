return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          numbers = 'none',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          separator_style = 'thin',
          show_buffer_close_icons = true,
          show_close_icon = true,
          style_preset = {
            require('bufferline').style_preset.no_italic,
          },
        },
      }

      -- Keymaps for switching buffers
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Close current buffer' })
    end,
  },
}
