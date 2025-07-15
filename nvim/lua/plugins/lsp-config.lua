return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

			-- Configurações de diagnóstico
			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})


			-- Keymaps
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "lsp saga hover" })
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "ver diagnóstico flutuante" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "diagnóstico anterior" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "próximo diagnóstico" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "ações de código" })

			-- Melhora a responsividade do CursorHold
			vim.opt.updatetime = 300
		end,
	},
}
