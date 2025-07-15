-- lua/plugins/luasnip.lua (ou similar)
return {
  'L3MON4D3/LuaSnip',
  -- Siga as instruções de instalação do seu gerenciador de plugins para dependências
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    -- ✨ ESTA LINHA É CRUCIAL ✨
    -- Carrega os snippets do pacote friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
