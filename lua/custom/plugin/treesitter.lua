return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,

	-- config
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"awk",
				"bash",
				"c",
				"css",
				"dockerfile",
				"gitignore",
				"javascript",
				"jq",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"nix",
				"passwd",
				"prql",
				"python",
				"query",
				"rust",
				"scss",
				"sql",
				"terraform",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"yuck",
			},

			sync_install = false,

			auto_install = true,

			ignore_install = {},

			highlight = {
				enable = true,
			},
		})
	end,
}
