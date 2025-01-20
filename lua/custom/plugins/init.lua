-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons

    config = function()
      require('oil').setup {

        columns = { 'icon' },
        keymaps = {
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = { show_hidden = true },
      }
      --open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })

      -- open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
