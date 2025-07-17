return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy", -- ou "BufReadPost" se quiser carregar após abrir um buffer
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- ou "tabs"
				numbers = "ordinal", -- "none" | "buffer_id" | "ordinal" | function
				indicator = {
					icon = "▎", -- ícone do indicador
					style = "icon", -- "underline" | "none"
				},
				tab_size = 22,
				separator_style = { "" },
				offsets = {
					{
						filetype = "NvimTree",
						-- text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
			},
		})

		-- Opcional: mapeamentos para trocar de buffer facilmente
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
	end,
}
