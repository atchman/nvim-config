-- mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    version = '*',
    lazy = false,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end
  }
}
