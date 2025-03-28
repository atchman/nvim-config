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

      vim.keymap.set("n", "<space>sh", require('telescope.builtin').help_tags, { desc = "[S]earch neovim [H]elp" })
      vim.keymap.set("n", "<space>sd", require('telescope.builtin').find_files, { desc = "[S]earch actual [D]irectoray" })
      vim.keymap.set("n", "<space>sk", require('telescope.builtin').keymaps, { desc = "[S]earch [K]eymap" })
      vim.keymap.set("n", "<space>sb", require('telescope.builtin').buffers, { desc = "[S]earch [B]uffer" })
      vim.keymap.set("n", "<space>sD", require('telescope.builtin').diagnostics, { desc = "[S]earch [D]iagnostic" })

      -- nvim config
      vim.keymap.set("n", "<space>sn", function()
          local opts = require('telescope.themes').get_ivy({
            cwd = vim.fn.stdpath("config")
          })
          require('telescope.builtin').find_files(opts)
        end,
        { desc = "[S]earch [N]eovim config" })

      -- -- packages installed with lany
      -- vim.keymap.set("n", "<space>fp", function()
      --   require('telescope.builtin').find_files {
      --     cmd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      --   }
      -- end)

      -- multigrep
      require "custom.multigrep".setup()
    end
  }
}
