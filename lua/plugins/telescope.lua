return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)

      -- nvim config
      vim.keymap.set("n", "<space>en", function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath("config")
        })
        require('telescope.builtin').find_files(opts)
      end)

      -- -- packages installed with lazy
      -- vim.keymap.set("n", "<space>ep", function()
      --   require('telescope.builtin').find_files {
      --     cmd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      --   }
      -- end)

      -- multigrep
      require "config.multigrep".setup()
    end
  }
}
