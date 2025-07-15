return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		-- Função que será chamada ao anexar o buffer do nvim-tree
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function open_and_close()
				api.node.open.edit()
				api.tree.close()
			end

			-- Aplica os mapeamentos padrão
			api.config.mappings.default_on_attach(bufnr)

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
			end

			-- Esses atalhos só funcionam dentro do buffer do nvim-tree
			vim.keymap.set("n", "l", api.node.open.edit, opts("Abrir arquivo"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Fechar diretório pai"))
			vim.keymap.set("n", "L", open_and_close, opts("Abre o arquivo e fecha o NvimTree"))
		end

		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			on_attach = on_attach, -- <- aqui você passa a função corretamente

			-- Impede autoabertura com diretório
			sync_root_with_cwd = false,
			respect_buf_cwd = false,
		})

		-- Atalhos globais fora do nvim-tree
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree: Alternar explorador de arquivos" })
		vim.keymap.set("n", "<leader>tl", "<cmd>NvimTreeResize +10<CR>", { desc = "NvimTree: Aumentar largura da árvore" })
		vim.keymap.set("n", "<leader>th", "<cmd>NvimTreeResize -10<CR>", { desc = "NvimTree: Diminuir largura da árvore" })
	end,
}
