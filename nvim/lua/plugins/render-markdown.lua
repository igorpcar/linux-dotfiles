return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	enabled = false,
	---@module 'render-markdown'
	---@type render.md.UserConfig

	opts = {
		file_types = { "markdown", "quarto" },
		anti_conceal = {
			enabled = true,
			disabled_modes = false,
			above = 0,
			below = 0,
			ignore = {
				code_background = true,
				indent = true,
				sign = true,
				virtual_lines = true,
			},
		},
		render_modes = true,
		injections = {
			gitcommit = {
				enabled = true,
				query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
			},
		},
	},

	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
