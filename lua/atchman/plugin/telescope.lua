-- telescope plugin

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
    dependencies = { 
        'nvim-lua/plenary.nvim' 
    },

    -- config
    opts = {
        defaults = {
          prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
              i = {
                ["<c-t>"] = function(...)
                  return require("trouble.providers.telescope").open_with_trouble(...)
                end,
                ["<a-t>"] = function(...)
                  return require("trouble.providers.telescope").open_selected_with_trouble(...)
                end,
                ["<a-i>"] = function()
                  Util.telescope("find_files", { no_ignore = true })()
                end,
                ["<a-h>"] = function()
                  Util.telescope("find_files", { hidden = true })()
                end,
                ["<C-Down>"] = function(...)
                  return require("telescope.actions").cycle_history_next(...)
                end,
                ["<C-Up>"] = function(...)
                  return require("telescope.actions").cycle_history_prev(...)
                end,
                ["<C-f>"] = function(...)
                  return require("telescope.actions").preview_scrolling_down(...)
                end,
                ["<C-b>"] = function(...)
                  return require("telescope.actions").preview_scrolling_up(...)
                end,
              },
              n = {
                ["q"] = function(...)
                  return require("telescope.actions").close(...)
                end,
              },
            },
          },
    },


}