-- options
--

vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.fileencoding = "utf-8"
vim.o.termguicolors = true

vim.o.mouse = "a"

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 20

-- update time
vim.o.updatetime = 250
-- mapped sequence wait time
vim.o.timeoutlen = 300

-- cursor
vim.o.cursorline = true
vim.o.cursorcolumn = false

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.showmode = false

-- Save undo history
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.o.shadafile = vim.fn.stdpath("cache") .. "/default.shada"


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
