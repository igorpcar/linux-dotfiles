return {
	"folke/zen-mode.nvim",
	opts = {
		plugins = {
			kitty = {
				enabled = true,
				font = "+8", -- font size increment
			},
		},
	},

	config = function(_, opts)
		require("zen-mode").setup(opts)
	end,
}
