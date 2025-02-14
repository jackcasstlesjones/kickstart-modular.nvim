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
          custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            local present_type = vim.bo[buf_number].filetype
            if present_type == '' then
              return false
            end
            return true
          end,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              highlight = 'Directory',
              separator = true,
            },
          },
        },
      }

      -- Keymaps for switching buffers
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
      -- Close buffer while preserving layout
      vim.keymap.set('n', '<leader>X', function()
        local current_buf = vim.api.nvim_get_current_buf()
        local last_buf = vim.fn.bufnr '#'
        -- If there's a last buffer, switch to it first
        if last_buf ~= -1 then
          vim.api.nvim_set_current_buf(last_buf)
        end
        -- Then delete the buffer we were on
        vim.cmd('bdelete ' .. current_buf)
      end, { desc = 'Close current buffer' })
    end,
  },
}
