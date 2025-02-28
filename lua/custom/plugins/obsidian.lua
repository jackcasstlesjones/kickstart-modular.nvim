return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    mappings = { -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    disable_frontmatter = true, -- Prevents automatic frontmatter insertion
    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian/jacks-vault',
      },
    },
    templates = {
      folder = 'Templates',
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'Dailies',
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = '%B %-d, %Y',
      -- Optional, default tags to add to each new daily note created.
      default_tags = { 'daily-notes' },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = 'daily-template.md',
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
      local current_note = vim.fn.expand '%:t:r' -- :r removes the extension
      vim.g.creation_source = current_note -- now set unconditionally
      vim.cmd 'ObsidianFollowLink'
    end

    vim.keymap.set('n', '<cr>', follow_link_with_source, { noremap = true, silent = true })

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
        table.insert(lines, '')
        table.insert(lines, '---')
        table.insert(lines, current_date)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, { 3, 0 })
      end,
    })
  end,
}
