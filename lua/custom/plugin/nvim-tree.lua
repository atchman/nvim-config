-- nvim-tree plugin

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
    
    --local builtin = require('nvim-tree.builtin')
        vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle)   -- Open or close the tree. Takes an optional path argument
        vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFocus)    -- Open the tree if it is closed, and then focus on the tree.
        vim.keymap.set('n', '<leader>tff', vim.cmd.NvimTreeFindFile) -- Move the cursor in the tree for the current buffer, opening folders if needed
        vim.keymap.set('n', '<leader>tc', vim.cmd.NvimTreeCollapse) -- Collapses the nvim-tree recursively

    require("nvim-tree").setup({
        sort_by = "case_sensitive",

        -- config
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    })
    end,

}
