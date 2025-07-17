return {
	"dkarter/bullets.vim",
	ft = { "markdown", "text", "gitcommit" },
	init = function()
		-- Configuração opcional: definir marcador padrão como '-'
		vim.g.bullets_enabled_file_types = { "markdown" }
		vim.g.bullets_outline_levels = { "num", "abc", "std-", "std*", "std+" }
	end,
}
