-- Treesitter

return {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,

    -- config
    config = function()
        require"nvim-treesitter.configs".setup {
            ensure_installed = {
                "awk",
                "bash",
                "c",
                "dockerfile",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "python",
                "rust",
                "vim",
                "vimdoc",
                "yaml"
            },

            sync_install = false,

            auto_install = true,

            ignore_install = {

            },

            highlight = {
                enable = true,
            },

        }
    end,

}
