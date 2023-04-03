-- main init of atchman

-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- install lazy as package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- setup call by lazy.nvim
require("lazy").setup("plugins")


-- Option / Core
require "atchman.config.options"
require "atchman.config.keymaps"



