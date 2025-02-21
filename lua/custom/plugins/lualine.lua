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
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'nord',
          -- theme = 'powerline_dark',
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
                bg = '#262E39', -- A nice blue from Nord theme
                fg = '#ffffff',
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
                local stats = vim.b.gitsigns_status_dict
                local bg_color = stats and ((stats.added or 0) + (stats.removed or 0) + (stats.changed or 0) > 0 and '#ffc100' or '#98c379') or '#98c379'

                return {
                  bg = bg_color,
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
            'diff',
            'diagnostics',
          },
          lualine_c = {
            'filename',
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
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
