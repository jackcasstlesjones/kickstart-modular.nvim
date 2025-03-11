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
      -- ['<cr>'] = {
      --   action = function()
      --     return require('obsidian').util.gf_passthrough()
      --   end,
      --   opts = { noremap = false, expr = true, buffer = true },
      -- },
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },

      ['<leader>ot'] = {
        action = function()
          return '<cmd>ObsidianTags<CR>'
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = 'Obsidian Tags' },
      },
      ['<leader>oe'] = {
        action = function()
          return '<cmd>ObsidianTemplate<CR>'
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = 'Obsidian Tags' },
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
      folder = 'templates',
      date_format = '%d/%m/%Y',
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
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = '#f78c6c' },
        ObsidianDone = { bold = true, fg = '#89ddff' },
        ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
        ObsidianTilde = { bold = true, fg = '#ff5370' },
        ObsidianImportant = { bold = true, fg = '#d73128' },
        ObsidianBullet = { bold = true, fg = '#ffc100' },
        ObsidianRefText = { underline = true, fg = '#c792ea' },
        ObsidianExtLinkIcon = { fg = '#c792ea' },
        ObsidianTag = { italic = true, fg = '#ffc100' },
        ObsidianBlockID = { italic = true, fg = '#89ddff' },
        ObsidianHighlightText = { bg = '#75662e' },
      },
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
    vim.keymap.set('v', '<leader>on', 'c[[<C-r>"]]<Esc>', { noremap = true, expr = false, desc = 'New Link' })

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
          -- Capitalize the first letter of each word
          local capitalized_source = vim.g.creation_source:gsub('(%a)(%w*)', function(first, rest)
            return first:upper() .. rest:lower()
          end)

          table.insert(lines, '[[' .. capitalized_source .. ']]')
          vim.g.creation_source = nil
        end
        table.insert(lines, '')
        table.insert(lines, '# title')
        table.insert(lines, '')
        table.insert(lines, '')
        table.insert(lines, '---')
        table.insert(lines, '')
        table.insert(lines, 'Related:')
        table.insert(lines, '')
        table.insert(lines, 'Tags:')
        table.insert(lines, '')
        table.insert(lines, current_date)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, { 3, 3 })
      end,
    })
  end,
}
