-- tokyonight theme

return {
    "folke/tokyonight.nvim", tag = "stable", 
    lazy = false,
    priority = 1000,     -- make sure to load this before all the other start plugins
    opts = {
        style = "moon"
    },
}
