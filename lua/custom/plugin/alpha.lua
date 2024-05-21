-- alpha
--
-- A highly configurable neovim startup screen


return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = function()
		local dashboard = require('alpha.themes.dashboard')
        local banner = {
            nvim = {
            "                                                        ",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
            "                                                        ",
            }
        }

        local function getDateTime()
            local dateTimeVar = os.date(" %Y-%m-%d   %H:%M:%S")
            return dateTimeVar
        end

--		require("alpha.term")
--        dashboard.section.terminal.width = 70
--        dashboard.section.terminal.height = 10
--        dashboard.section.terminal.opts.redraw = true
--        dashboard.section.terminal.opts.window_config.zindex = 1

        local dateTime = getDateTime()
        local header = banner.nvim
-- .. "\n" .. dateTime .. "\n"
--        dashboard.section.header.val = vim.split(banner .. "\n" .. dateTime, "\n")
        dashboard.section.header.val = header
        dashboard.section.buttons.val = {
			dashboard.button('i', '    new file', ':ene <BAR> startinsert <CR>'),
			dashboard.button('r', '    recent files', ':Telescope oldfiles <CR>'),
			dashboard.button('f', '󰥨    find file', ':Telescope find_files <CR>'),
			dashboard.button('g', '󰱼    find text', ':Telescope live_grep_args <CR>'),
            dashboard.button('c', '    config', ':e $MYVIMRC <CR>'),
			dashboard.button('h', '    browse git', ':Flog<CR>'),
			dashboard.button('l', '󰒲    lazy', ':Lazy<CR>'),
			dashboard.button('m', '󱌣    mason', ':Mason<CR>'),
			dashboard.button('q', '󰭿    quit', ':qa<CR>'),
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = 'AlphaButtons'
			button.opts.hl_shortcut = 'AlphaShortcut'
		end
        dashboard.section.header.opts.hl = 'AlphaHeader'
		dashboard.section.buttons.opts.hl = 'AlphaButtons'
		dashboard.section.footer.opts.hl = 'AlphaFooter'
		dashboard.opts.layout[1].val = 2

--        dashboard.opts.layout = {
--            { type = "padding", val = 2 },
--            dashboard.section.terminal,
--            { type = "padding", val = 2 },
--            dashboard.section.header,
--            { type = "padding", val = 1 },
--            dashboard.section.buttons,
--            { type = "padding", val = 2 },
--            dashboard.section.footer,
 --       }
		return dashboard
	end,
	config = function(_, dashboard)
		-- close lazy and re-open when the dashboard is ready
		if vim.o.filetype == 'lazy' then
			vim.cmd.close()
			vim.api.nvim_create_autocmd('User', {
				pattern = 'AlphaReady',
				callback = function()
					require('lazy').show()
				end,
			})
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local version = "  󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
				local plugins = '󱐋 ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
                local footer = version .. "\t" .. plugins .. "\n"
                dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

        dashboard.opts.opts.noautocmd = false
        require('alpha').setup(dashboard.opts)
--        vim.cmd([[
--         autocmd FileType alpha setlocal nofoldenable
--        ]])

	end,
}
