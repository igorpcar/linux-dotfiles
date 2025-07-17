return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "mocha",
		transparent_background = true,
		custom_highlights = function(colors)
			return {
				-- Mudar a cor dos números de linha normais
				LineNr = { fg = colors.overlay0, bg = "NONE" }, -- Exemplo: roxo para LineNr
			}
		end,
	},
	priority = 1000,
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
