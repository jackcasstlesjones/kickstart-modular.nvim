return {
  {
    'hedyhli/markdown-toc.nvim',
    ft = 'markdown', -- Lazy load on markdown filetype
    cmd = { 'Mtoc' }, -- Or, lazy load on "Mtoc" command
    opts = {
      -- Your configuration here (optional)
      fences = {
        enabled = false,
      },
      headings = {
        pattern = '^(##)%s+(.+)$',
      },
      item_format_string = '${indent} [${name}](#${link})',
      toc_list = {
        -- string or list of strings (for cycling)
        -- If cycle_markers = false and markers is a list, only the first is used.
        -- You can set to '1.' to use a automatically numbered list for ToC (if
        -- your markdown render supports it).
        markers = '',
      },
      keys = { vim.keymap.set({ 'n', 'v' }, '<leader>md', 'd<cmd>Mtoc<CR>', { desc = 'Create Toc' }) },
    },
  },
}
