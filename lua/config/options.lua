-- options
--

vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true

vim.opt.mouse = "a"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 20

-- update time
vim.opt.updatetime = 250
-- mapped sequence wait time
vim.opt.timeoutlen = 300

-- cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.shadafile = vim.fn.stdpath("cache") .. "/default.shada"


-- diff
vim.opt.fillchars = {
  diff = "/",
}
vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
}

-- vim.diagnostic.config = {
--   signs = {
--     text = {
--       error = icon,
--       warn = warn_icon,
--     }
--   }
-- }
