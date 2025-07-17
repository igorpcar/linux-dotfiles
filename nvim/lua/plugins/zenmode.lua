return {
	"folke/zen-mode.nvim",
	enabled = true,
	opts = {
		plugins = {
			kitty = {
				enabled = true,
				-- font = "+2", -- font size increment
			},
		},
		-- window = {
		--   width = 180,
		-- },
	},

	config = function(_, opts)
		require("zen-mode").setup(opts)
	end,
}
