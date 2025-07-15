return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						icons = {
							heading = {
								icons = {
									" ",
									"󱞩",
									"",
                  "󰜴",
                  "",
								},
							},
						},
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Documentos/Notes",
							software = "~/Documentos/Eng de Software/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.itero"] = {},
				["core.integrations.treesitter"] = {},
				["core.qol.toc"] = {
					config = {
						close_after_use = true,
					},
				},
			},
		})
		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2

		vim.keymap.set("n", "<localleader>n", "<Plug>(neorg.treesitter.next.heading)", {})
		vim.keymap.set("n", "<localleader>p", "<Plug>(neorg.treesitter.previous.heading)", {})
		vim.keymap.set("n", "<localleader>g0", ":Neorg toc<CR>", {})
	end,
}
