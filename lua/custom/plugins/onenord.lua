return {
  {
    'rmehri01/onenord.nvim',
    lazy = false, -- Load immediately
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
      require('onenord').setup {
        disable_background = true,
        transparent = true,
      }
      vim.cmd.colorscheme 'onenord'
    end,
  },
}
