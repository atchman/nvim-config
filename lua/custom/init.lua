-- main init

-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- nvim-tree plugin
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Option / Core
require("custom.config.options")
require("custom.config.keymaps")

-- install lazy as package manager
-- bootstrap
require("custom.lazy_init")

-- theme
require("custom.config.colorscheme")
