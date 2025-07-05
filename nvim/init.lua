-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Movimento com Ctrl + hjkl no modo insert
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
