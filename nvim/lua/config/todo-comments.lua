require("todo-comments").setup({
  -- outras configs...
  search = {
    command = "rg", -- usa ripgrep (recomendado)
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--glob=!**/node_modules/*", -- 🛑 ignora node_modules
    },
  },
})
