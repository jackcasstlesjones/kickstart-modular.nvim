local function open_nvim_tree()
  require('nvim-tree.api').tree.open()
end

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
        signcolumn = 'no', -- Removes the left sign column
      },
      git = { enable = false },
      filters = {
        dotfiles = true,
      },
      hijack_directories = {
        enable = false,
        auto_open = false,
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        -- Define key mappings
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)
        -- Remap 'l' to open/close directories and open files
        vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Explorer' })
      end,
    }

    -- Ensure the tree opens on VimEnter
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      group = vim.api.nvim_create_augroup('NvimTreeAutoRefresh', { clear = true }),
      callback = function()
        local api = require 'nvim-tree.api'
        if vim.fn.bufname() ~= '' then
          api.tree.reload() -- Refresh the tree view
          api.tree.find_file { follow = true } -- Navigate to the current file in the tree
        end
      end,
    })
  end,
}
