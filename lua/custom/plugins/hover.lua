return {
  'lewis6991/hover.nvim',
  lazy = false, -- or `event = "LspAttach"` if you want to defer
  config = function()
    require('hover').setup {
      init = function()
        require 'hover.providers.lsp'
        -- Add more providers if you want (e.g. man pages, gh, dictionary)
      end,
      preview_opts = {
        border = 'double',
      },
      title = true,
      mouse_providers = {
        'LSP',
      },
      mouse_delay = 500,
    }

    vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
    vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim select' })
    vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })

    -- Optional: Enable mouse hover support (requires Neovim 0.10+)
    vim.o.mousemoveevent = true
  end,
}
