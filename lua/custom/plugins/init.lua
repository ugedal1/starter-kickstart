-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'akinsho/git-conflict.nvim', version = '*', config = true },

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
      -- open parent directory in floating window
      vim.keymap.set('n', '-', require('oil').toggle_float)
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    },
  },

  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('easy-dotnet').setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      local null_ls = require 'null-ls'
      local lsp_util = require 'lspconfig.util'

      return {
        root_dir = lsp_util.root_pattern('.prettierrc', '.prettierrc.json', 'prettier.config.js', 'package.json', '.git'),
        sources = {
          null_ls.builtins.formatting.prettierd.with {
            -- Let prettierd auto-detect config like in VSCode
            extra_args = {},
          },
        },
      }
    end,
  }, -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },
}
