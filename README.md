# Jack's Kickstarter Nvim Setup

## File Navigation

- `<leader><leader>` to search files using [Smart open](https://github.com/danielfalk/smart-open.nvim) (fzf with memory).
- `<leader>k` to browse open buffers, sorted by most recent and excluding current buffer, using [telescope](https://github.com/nvim-telescope/telescope.nvim).
- `<leader>z` to open [zoxide](https://github.com/ajeetdsouza/zoxide) in Nvim using [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) (this uses the system-wide zoxide memory).
- `<leader>y` to open [yazi](https://github.com/mikavilpas/yazi.nvim). `g d` then navigates to `Downloads` folder. Press `z` to search using zoxide inside yazi.

## File Search & Editing

- `s` uses [flash](https://github.com/folke/flash.nvim) to search text inside a file.
- `f` or `F` replaces the default `find` motions using [eyeliner](https://github.com/jinh0/eyeliner.nvim).
- `<leader>u` to see an undo history using [telescope-undo](https://github.com/debugloop/telescope-undo.nvim).
- `<leader>l` to insert inside the last double quote on current line (for Tailwind).
- `<leader>d` to delete without yanking.
- `c` replaces the default yanking behaviour.
- `<leader>w` to save the current file.
- `Q` to quit all Neovim instances.
- Format on save, or with `<leader>mp`, using [conform](https://github.com/stevearc/conform.nvim) and Prettier.
- Use the [emmet-language-server](https://github.com/olrtg/emmet-language-server) just like VSCode.
- Highlight a selection in Visual Mode and use `S` followed by a parentheses or bracket to wrap that character around the selection using [surround](https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua)

## UI

- This setup uses [noice](https://github.com/folke/noice.nvim) for UI components and popups.
- Quitting confirmation is on, meaning you will be asked to confirm whether to save files when quitting with unsaved changes.
- `tb` to toggle git blame using [gitsigns](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim).
- `tm` to toggle [markview](https://github.com/OXY2DEV/markview.nvim).

## Version Control

- `<leader>g` for Lazygit
