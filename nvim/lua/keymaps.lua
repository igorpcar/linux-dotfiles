vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Bullets
vim.keymap.set("n", "<leader>o", ":ToggleCheckbox<CR>", { desc = "Toggle checkbox" })

-- Alternar exibição da coluna de sinais (Git, diagnostics, etc.)
vim.keymap.set("n", "<leader>tg", function()
  local signs = vim.wo.signcolumn
  if signs == "yes" then
    vim.wo.signcolumn = "no"
  else
    vim.wo.signcolumn = "yes"
  end
end, { desc = "Toggle Git sign column" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Navigation in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Mover cursor para a esquerda" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Mover cursor para baixo" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Mover cursor para cima" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Mover cursor para a direita" })

-- Buffer mappings 
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set("n", "<leader> ", ":BufferLinePick<CR>", { noremap = true })
vim.keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", { noremap = true })
vim.keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", { noremap = true })
vim.keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", { noremap = true })
vim.keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", { noremap = true })
vim.keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", { noremap = true })
vim.keymap.set("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Close current split" }) -- close current split window

-- Telescope mappings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { noremap = true, desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, desc = "Grep files" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, desc = "Find buffers" })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { noremap = true, desc = "Find string under cursor" })

-- Split mappings
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
--
-- Clear search results
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Formatting
vim.keymap.set({ "v", "x", "n" }, "<leader>fm", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- ZenMode
-- vim.keymap.set("n", "<leader>z", ":Twilight<CR>", { desc = "Entra ou sai do ZenMode", silent = true })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Entra ou sai do ZenMode", silent = true })

-- Função Lua para abrir o arquivo
local function OS_open_file_under_cursor()
	local line = vim.api.nvim_get_current_line()
	local cursor_col = vim.fn.col(".") -- posição do cursor (1-based)

	-- Busca por pares de aspas simples ou duplas
	for start_idx, quote, str, end_idx in line:gmatch("()(['\"])(.-)%2()") do
		if cursor_col >= start_idx and cursor_col <= end_idx then
			-- print("Texto entre " .. quote .. ": " .. str)
			vim.cmd('!xdg-open "' .. str .. '"')
			return str
		end
	end

	print("Nenhuma string entre aspas simples ou duplas sob o cursor.")
	return nil
end

vim.keymap.set("n", "<leader>ox", OS_open_file_under_cursor, { noremap = true, silent = true })

