return {
  'lewis6991/gitsigns.nvim',
  -- Opcional: Adiciona uma configuração se quiser customizar,
  -- mas o padrão já funciona perfeitamente para a integração.
  config = function()
    require('gitsigns').setup({
      -- A configuração padrão é excelente.
      -- Você pode adicionar customizações aqui se desejar no futuro.
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
    })
  end
}
