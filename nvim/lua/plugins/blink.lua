return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        -- Outros mapeamentos podem ser adicionados conforme necessário
      },
      -- Outras configurações...
    },
  },
}
