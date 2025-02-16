return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
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

    -- note_path_func = function(spec)
    --   -- Hardcode the vault root to ensure we reference the correct base directory.
    --   local vault_root = vim.fn.expand '~/obsidian/jacks-vault'
    --   -- Use the existing "Notes" folder at the vault root.
    --   local notes_folder = vault_root .. '/Notes'
    --   return notes_folder .. '/' .. spec.id .. '.md'
    -- end,
  },
}
