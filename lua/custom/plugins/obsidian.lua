return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    disable_frontmatter = true, -- Prevents automatic frontmatter insertion
    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian/jacks-vault',
      },
    },

    -- This tells obsidian.nvim that your notes are kept in a folder named "Notes"
    notes_subdir = 'Notes',

    ui = {
      enable = false, -- disable additional UI features
    },

    note_id_func = function(title)
      if title and title ~= '' then
        -- Convert the wikilink text into a sanitized note id.
        return title:gsub(' ', '-'):gsub('[^%w%-_]', ''):lower()
      else
        error 'Note title is required to create a new note!'
      end
    end,

    follow_url_func = function(url)
      vim.fn.jobstart { 'open', '-a', 'Arc', url }
    end,
  },

  config = function(_, opts)
    local obsidian = require 'obsidian'
    obsidian.setup(opts)

    -- Always store the source filename before following the link
    local function follow_link_with_source()
      local current_note = vim.fn.expand '%:t'
      vim.g.creation_source = current_note -- now set unconditionally
      vim.cmd 'ObsidianFollowLink'
    end

    vim.keymap.set('n', '<leader>o', follow_link_with_source, { noremap = true, silent = true })

    vim.api.nvim_create_autocmd('BufNewFile', {
      pattern = '*.md',
      callback = function()
        local current_date = os.date '%d/%m/%Y' -- day/month/year format
        local lines = {}
        if vim.g.creation_source then
          table.insert(lines, '[[' .. vim.g.creation_source .. ']]')
          vim.g.creation_source = nil
        end
        table.insert(lines, '')
        table.insert(lines, '')
        table.insert(lines, '---')
        table.insert(lines, current_date)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, { 2, 0 })
      end,
    })
  end,
}
