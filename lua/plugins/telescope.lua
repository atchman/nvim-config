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

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "fuzzy neovim help" })
      vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files, { desc = "fuzzy actual directoray" })
      vim.keymap.set("n", "<space>fk", require('telescope.builtin').keymaps, { desc = "find keymap" })

      -- nvim config
      vim.keymap.set("n", "<space>fn", function()
          local opts = require('telescope.themes').get_ivy({
            cwd = vim.fn.stdpath("config")
          })
          require('telescope.builtin').find_files(opts)
        end,
        { desc = "fuzzy neovim config" })

      -- -- packages installed with lazy
      -- vim.keymap.set("n", "<space>fp", function()
      --   require('telescope.builtin').find_files {
      --     cmd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      --   }
      -- end)

      -- multigrep
      require "config.multigrep".setup()
    end
  }
}
