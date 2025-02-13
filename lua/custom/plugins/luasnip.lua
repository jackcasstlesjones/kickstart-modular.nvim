-- In your lazy.nvim plugins configuration file (e.g., lua/plugins/init.lua)
return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip', -- Only if you're using nvim-cmp
    },
    config = function()
      local ls = require 'luasnip'
      local types = require 'luasnip.util.types'

      ls.config.set_config {
        enable_autosnippets = true,
        updateevents = 'TextChanged,TextChangedI',
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '●', 'GruvboxOrange' } },
            },
          },
          [types.insertNode] = {
            active = {
              virt_text = { { '●', 'GruvboxBlue' } },
            },
          },
        },
      }

      -- Loading snippets from your custom directory
      require('luasnip.loaders.from_lua').lazy_load { paths = '~/.config/nvim/snippets/' }

      -- Key mappings
      vim.keymap.set({ 'i', 's' }, '<C-k>', function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-j>', function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set('i', '<C-l>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },
}
