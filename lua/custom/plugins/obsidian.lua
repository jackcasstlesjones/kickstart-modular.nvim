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
  },
  config = function(_, opts)
    local obsidian = require 'obsidian'
    obsidian.setup(opts)

    -- Wrapper function for following links that stores the MOC source
    local function follow_link_with_source()
      -- Get the current note's filename (e.g. "moc-hiking.md" or "moc-travel.md")
      local current_note = vim.fn.expand '%:t'
      -- Only store if it starts with "moc-"
      if current_note:match '^moc%-' then
        vim.g.moc_source = current_note
      else
        vim.g.moc_source = nil
      end
      -- Call the Obsidian command to follow the link
      vim.cmd 'ObsidianFollowLink'
    end

    -- Map the custom follow-link command using a function callback
    vim.keymap.set('n', '<leader>ol', follow_link_with_source, { noremap = true, silent = true })

    -- Autocommand to insert the backlink at the top of newly created Markdown files
    vim.api.nvim_create_autocmd('BufNewFile', {
      pattern = '*.md',
      callback = function()
        if vim.g.moc_source then
          local current_date = os.date '%d/%m/%Y' -- day month year format
          vim.api.nvim_buf_set_lines(0, 0, 0, false, {
            '[[' .. vim.g.moc_source .. ']]', -- line 1: backlink
            '', -- line 2: empty (cursor here)
            '', -- line 3: extra empty line
            '---',
            current_date, -- line 4: date
          })
          vim.g.moc_source = nil
          vim.api.nvim_win_set_cursor(0, { 2, 0 })
        end
      end,
    })
  end,
}
