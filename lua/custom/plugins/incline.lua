return {
  {
    'b0o/incline.nvim',
    enabled = false,
    config = function()
      local function render(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        local modified = vim.bo[props.buf].modified
        local bg_color = modified and '#ffc100' or '#d8dee9' -- Red bg if modified, else default

        return {
          filename,
          modified and { guifg = '#888888', gui = 'bold' } or '',
          guibg = bg_color,
          guifg = '#000000',
        }
      end

      require('incline').setup {
        render = render,
      }
    end,
    event = 'VeryLazy',
  },
}
