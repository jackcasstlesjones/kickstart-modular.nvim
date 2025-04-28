return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig

    config = function()
      -- Set all heading backgrounds and foregrounds to orange
      require('render-markdown').setup {
        anti_conceal = {
          -- This enables hiding any added text on the line the cursor is on
          enabled = false,
        },
        bullet = {
          icons = { '•', '◦', '◆', '◇' },
        },

        link = {
          wiki = {
            icon = '󱗖 ',
            body = function()
              return nil
            end,
            highlight = 'RenderMarkdownWikiLink',
          },
        },
        -- Window options to use that change between rendered and raw view.
        win_options = {
          -- -- @see :h 'conceallevel'
          -- conceallevel = {
          --   -- Used when not being rendered, get user setting.
          --   default = vim.api.nvim_get_option_value('conceallevel', {}),
          --   -- Used when being rendered, concealed text is completely hidden.
          --   rendered = 3,
          -- },
          -- @see :h 'concealcursor'
          concealcursor = {
            -- Used when not being rendered, get user setting.
            default = vim.api.nvim_get_option_value('concealcursor', {}),
            -- Used when being rendered, disable concealing text in all modes.
            rendered = 'n', -- Conceal in normal, visual, and insert modes
          },
        },
        heading = {
          -- Turn on / off heading icon & background rendering
          enabled = true,
          -- Additional modes to render headings
          render_modes = false,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Replaces '#+' of 'atx_h._marker'
          -- The number of '#' in the heading determines the 'level'
          -- The 'level' is used to index into the list using a cycle
          -- If the value is a function the input context contains the nesting level of the heading within sections
          -- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          icons = { '', '', '', '', '', '' },
          -- Determines how icons fill the available space:
          --  right:   '#'s are concealed and icon is appended to right side
          --  inline:  '#'s are concealed and icon is inlined on left side
          --  overlay: icon is left padded with spaces and inserted on left hiding any additional '#'
          position = 'overlay',
          -- Added to the sign column if enabled
          -- The 'level' is used to index into the list using a cycle
          signs = { '󰫎 ' },
          -- Width of the heading background:
          --  block: width of the heading text
          --  full:  full width of the window
          -- Can also be a list of the above values in which case the 'level' is used
          -- to index into the list using a clamp
          width = 'full',
          -- Amount of margin to add to the left of headings
          -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
          -- Margin available space is computed after accounting for padding
          -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
          left_margin = 0,
          -- Amount of padding to add to the left of headings
          -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
          -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
          left_pad = 0,
          -- Amount of padding to add to the right of headings when width is 'block'
          -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
          -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
          right_pad = 0,
          -- Minimum width to use for headings when width is 'block'
          -- Can also be a list of integers in which case the 'level' is used to index into the list using a clamp
          min_width = 0,
          -- Determines if a border is added above and below headings
          -- Can also be a list of booleans in which case the 'level' is used to index into the list using a clamp
          border = false,
          -- Always use virtual lines for heading borders instead of attempting to use empty lines
          border_virtual = false,
          -- Highlight the start of the border using the foreground highlight
          border_prefix = false,
          -- Used above heading for border
          above = '▄',
          -- Used below heading for border
          below = '▀',
          -- The 'level' is used to index into the list using a clamp
          -- Highlight for the heading icon and extends through the entire line
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
          },
          -- The 'level' is used to index into the list using a clamp
          -- Highlight for the heading and sign icons
          foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
          },
          -- Define custom heading patterns which allow you to override various properties
          -- based on the contents of a heading. Each entry should consist of a string key,
          -- which is used mostly as an identifier, and a table value with:
          --   'pattern':    Matched against the heading text see :h lua-pattern
          --   'icon':       Optional override for the icon
          --   'background': Optional override for the background
          --   'foreground': Optional override for the foreground
          custom = {},
        },
      }
      vim.api.nvim_set_hl(0, 'RenderMarkdownBullet', { fg = '#ffc100' }) -- Red color
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.api.nvim_set_hl(0, '@markup.strong', { fg = '#ebcb8b', bold = true })
        end,
      })
      -- vim.api.nvim_set_hl(0, 'RenderMarkdownWikiLink', { fg = '#ffc100' }) -- Red color
      local colors = {
        h1_bg = '#4C272A', -- Darkened Nord Red (original #BF616A)
        h2_bg = '#414C38', -- Darkened Nord Green (original #A3BE8C)
        h3_bg = '#5E5138', -- Much Darkened Nord Yellow (original #EBCB8B)
        h4_bg = '#53362D', -- Darkened Nord Orange (original #D08770)
        h5_bg = '#483945', -- Darkened Nord Purple (original #B48EAD)
        h6_bg = '#263445', -- Darkened Nord Blue (original #5E81AC)
        text_fg = '#ffffff', -- Your foreground text color
      }
      -- Backgrounds
      local bgHighlights = {
        RenderMarkdownH1Bg = colors.h1_bg,
        RenderMarkdownH2Bg = colors.h2_bg,
        RenderMarkdownH3Bg = colors.h3_bg,
        RenderMarkdownH4Bg = colors.h4_bg,
        RenderMarkdownH5Bg = colors.h5_bg,
        RenderMarkdownH6Bg = colors.h6_bg,
      }

      -- Foregrounds (text)
      local fgHighlights = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      }

      -- Apply background highlights
      for hl, color in pairs(bgHighlights) do
        vim.api.nvim_set_hl(0, hl, { bg = color, blend = 50 }) -- Apply blend for transparency
      end

      -- Apply foreground (text) highlights
      for _, hl in ipairs(fgHighlights) do
        vim.api.nvim_set_hl(0, hl, { fg = colors.text_fg })
      end
    end,
    opts = {},
  },
}
