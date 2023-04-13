-- Dashboard

local banner_logo = [[

   ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
   ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
   ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
   ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
   ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
   ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

]]

return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup {
    -- config
        theme = 'hyper',
        disable_move = 'false',
        shortcut_type = 'letter',

        config = {
            header = vim.split(banner_logo, "\n"),

            --[[
            center = {
              {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'lua print(2)'
              },
              {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'f',
                keymap = 'SPC f d',
                action = 'lua print(3)'
              },
            },
            footer = {}  --your footer
            --]]
        }
      }
    end,
}
