# Jack's Kickstarter Nvim Setup

## File Navigation

- `<leader><leader>` to search files using [Ssmart open](https://github.com/danielfalk/smart-open.nvim) (fzf with memory).
- `<leader>k` to browser open buffers, sorted by most recent and excluding current buffer, using [telescope](https://github.com/nvim-telescope/telescope.nvim).
- `<leader>z` to open [zoxide](https://github.com/ajeetdsouza/zoxide) in Nvim using [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) (this uses the system-wide zoxide memory).
- `<leader>y` to open [yazi](https://github.com/mikavilpas/yazi.nvim). `g d` then navigates to `Downloads` folder. Press `z` to search using zoxide inside yazi.

## File Search & Editing

- `s` to use [Flash](https://github.com/folke/flash.nvim) to search text inside a file.
- `f` or `F` replaces the default `find` motions using [eyEeliner](https://github.com/jinh0/eyeliner.nvim).
- `<leader>u` to see an undo history using [telescope-undo](https://github.com/debugloop/telescope-undo.nvim).
- `<leader>l` to insert inside the last double quote on current line (for Tailwind).
- `<leader>d` to delete without yanking.
- `c` replaces the default yanking behaviour.
- `<leader>w` to save the current file.
- `Q` to quit all Neovim instances.
