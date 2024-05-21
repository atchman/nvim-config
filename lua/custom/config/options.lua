-- setting options

-- line numbers
vim.opt.number = true
-- relative line numbers
vim.opt.relativenumber = true

-- enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- tab
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 --
vim.opt.shiftwidth = 4 --
vim.opt.expandtab = true -- Use spaces instead of tabs

-- indent
vim.opt.smartindent = true -- Insert indents automatically

vim.opt.wrap = false -- Disable line wrap

-- search
vim.opt.hlsearch = false -- Set highlight on search
vim.opt.incsearch = true --

vim.opt.termguicolors = true -- True color support

vim.opt.scrolloff = 8 -- Lines of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50 -- Save swap file and trigger CursorHold

-- undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- Save undo history

-- cursor
vim.opt.cursorline = true -- Enable highlighting of the cursor line
vim.opt.cursorcolumn = false
vim.opt.guicursor = "" -- normal insert mode cursor the same

--[[
Option Example

local opt = vim.opt


vim.opt.colorcolumn = "80"
opt.autowrite = true        -- Enable auto write
opt.clipboard = "unnamedplus"       -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3        -- Hide * markup for bold and italic
opt.confirm = true          -- Confirm to save changes before exiting modified buffer
opt.cursorline = true       -- Enable highlighting of the current line
opt.expandtab = true        -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt"      -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true       -- Ignore case
opt.inccommand = "nosplit"      -- preview incremental substitute
opt.laststatus = 0
opt.list = true         -- Show some invisible characters (tabs...
opt.mouse = "a"         -- Enable mouse mode
opt.number = true       -- Print line number
opt.pumblend = 10       -- Popup blend
opt.pumheight = 10      -- Maximum number of entries in a popup
opt.relativenumber = true       -- Relative line numbers
opt.scrolloff = 4       -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true       -- Round indent
opt.shiftwidth = 2      -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false        -- Dont show mode since we have a statusline
opt.sidescrolloff = 8       -- Columns of context
opt.signcolumn = "yes"      -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true        -- Don't ignore case with capitals
opt.smartindent = true      -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true       -- Put new windows below current
opt.splitright = true       -- Put new windows right of current
opt.tabstop = 2             -- Number of spaces tabs count for
opt.termguicolors = true    -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200        -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full"      -- Command-line completion mode
opt.winminwidth = 5         -- Minimum window width
opt.wrap = false            -- Disable line wrap

--]]
