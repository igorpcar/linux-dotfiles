-- No seu arquivo de plugins (ex: lua/plugins/autotag.lua)
return {
  'windwp/nvim-ts-autotag',
  -- Opcional: especificar dependência, embora o lazy.nvim seja bom em detectar
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, 
  config = function()
    -- A configuração é simples, geralmente as opções padrão já são ótimas.
    require('nvim-ts-autotag').setup({
        -- Você pode adicionar configurações aqui se precisar,
        -- mas para começar, um setup vazio é o suficiente.
    })
  end,
}
