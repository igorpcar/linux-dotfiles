return {
	"goolord/alpha-nvim",
  enabled = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > Novo arquivo", "<cmd>ene<CR>"),
			dashboard.button("e", "  > Explorador de arquivos", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("f", "󰱼  > Encontrar arquivo", "<cmd>Telescope find_files<CR>"),
			dashboard.button("g", "  > Grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("q", "  > Sair", "<cmd>qa<CR>"),
		}

		-- Abrir Alpha na inicialização se não houver argumentos
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- if vim.fn.argc() == 0 then
					require("alpha").start(true)
				-- end
			end,
		})

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
