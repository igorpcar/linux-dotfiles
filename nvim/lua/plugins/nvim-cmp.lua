-- lua/plugins/completion.lua

return {
	{
		-- O motor de autocompletar
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip", -- Dependência para snippets
			"saadparwaiz1/cmp_luasnip", -- Ponte entre cmp e luasnip
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				-- Habilita o suporte a snippets
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				-- Mapeamentos de teclado para o menu de autocompletar
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<Tab>"] = cmp.mapping.confirm({ select = false }),
				}),

				["<Tab>"] = cmp.mapping(function(fallback)
					-- Se estiver dentro de um snippet, pula para o próximo placeholder
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					-- Se não, executa o comportamento padrão do Tab (ex: indentação)
					else
						fallback()
					end
				end, { "i", "s" }), -- Executa em modo de Inserção e Seleção

				-- [[ ✨ MUDANÇA AQUI ✨ ]] --
				-- As fontes agora são agrupadas. O segundo grupo só é usado
				-- se o primeiro não tiver boas sugestões, evitando duplicatas.
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						entry_filter = function(entry, ctx)
							return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
						end,
					}, -- PROBLEMAAAA SNIPETS
					{ name = "luasnip" }, -- snippets
					{ name = "path" }, -- file system paths
				}),
			})
		end,
	},
}
