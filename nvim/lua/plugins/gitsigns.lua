return {
  'lewis6991/gitsigns.nvim',
  enabled = true,
  -- Opcional: Adiciona uma configuração se quiser customizar,
  -- mas o padrão já funciona perfeitamente para a integração.
  opts = {},
	config = function(_, opts)
    require('gitsigns').setup(opts)
	end,
}
