return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Function to get project root
      local function get_project_root()
        local path = vim.fn.getcwd()
        return vim.fn.fnamemodify(path, ':t')
      end

      -- Optimized Git status check to reduce cursor flicker
      local last_git_check = 0
      local git_dirty = false

      local function get_git_status()
        local current_time = vim.loop.now()

        -- Only check git status every 2 seconds
        if current_time - last_git_check > 2000 then
          last_git_check = current_time

          local git_dir = vim.fn.systemlist('git rev-parse --git-dir 2>/dev/null')[1]
          if not git_dir then
            git_dirty = false
            return false
          end

          local changes = vim.fn.systemlist 'git status --porcelain 2>/dev/null'
          git_dirty = #changes > 0
        end

        return git_dirty
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'nord',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              get_project_root,
              color = {
                bg = '#b48ead',
                fg = '#000000',
                gui = 'bold',
              },
              separator = {
                right = '\u{e0b0}', -- Right-pointing arrow
                left = '', -- Empty left separator since it's the first component
              },
              padding = { left = 1, right = 1 },
            },
            'pwd', -- Show current working directory
            {
              'branch',
              draw_empty = true,
              color = function()
                return {
                  -- bg = get_git_status() and '#ffc100' or '#81a1c1',
                  bg = get_git_status() and '#ffc100' or '#a3be8c',
                  fg = '#000000',
                  gui = 'bold',
                }
              end,
              separator = {
                right = '', -- This creates the arrow effect
                left = '', -- This allows the left component's arrow to show
              },
              padding = { left = 1, right = 1 },
            },
            {
              'diff',
              color = function()
                return {
                  bg = '#3b4252',
                }
              end,
              separator = {
                right = '', -- This creates the arrow effect
                left = '', -- This allows the left component's arrow to show
              },
            },
            'diagnostics',
          },
          lualine_c = {
            'filename',
          },
          lualine_x = {
            'encoding',
            'fileformat',
            {
              'filetype',
              draw_empty = true,
              color = function()
                return {
                  -- bg = get_git_status() and '#ffc100' or '#81a1c1',
                  bg = '#d08770',
                  fg = '#000000',
                  gui = 'bold',
                }
              end,
              separator = {
                left = '', -- This creates the arrow effect
                right = '', -- This allows the left component's arrow to show
              },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
