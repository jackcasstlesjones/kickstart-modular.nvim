return {
  'scottmckendry/cyberdream.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      variant = 'default',
      transparent = true, -- Set to true to enable transparency
    }
    vim.cmd 'colorscheme cyberdream' -- Add this line here
  end,
}
