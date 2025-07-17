-- Cria um "augroup" para garantir que os autocomandos não sejam duplicados
local lsp_highlight_group = vim.api.nvim_create_augroup("LspSymbolHighlight", { clear = true })

-- Função auxiliar para verificar se algum dos LSPs ativos suporta documentHighlight
local function supports_document_highlight()
	-- Pega todos os clientes LSP ativos para o buffer atual
	-- MUDANÇA AQUI: de get_active_clients para get_clients
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	-- Itera sobre os clientes
	for _, client in ipairs(clients) do
		-- Verifica se o cliente anuncia suporte para documentHighlight
		-- O nome da capacidade no Neovim é 'document_highlight_provider'
		if client and client.server_capabilities and client.server_capabilities.document_highlight_provider then
			return true -- Encontrou um cliente que suporta, então retorna verdadeiro
		end
	end

	return false -- Nenhum cliente ativo suporta a funcionalidade
end

-- Autocomando que ativa o realce quando o cursor fica parado
vim.api.nvim_create_autocmd("CursorHold", {
	group = lsp_highlight_group,
	pattern = "*", -- Aplica a todos os arquivos
	callback = function()
		-- Usa a nova função para verificar se o highlight é suportado ANTES de chamá-lo
		if supports_document_highlight() then
			vim.lsp.buf.document_highlight()
		end
	end,
	desc = "Realçar símbolo sob o cursor se o LSP suportar",
})

-- Autocomando que limpa o realce quando o cursor se move ou entramos no modo de inserção
vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
	group = lsp_highlight_group,
	pattern = "*",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
	desc = "Limpar realce de símbolo",
})

-- Como eu desativei a barra de status, precisa disso para ver as gravações de macro
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		vim.notify("Gravando macro...", vim.log.levels.INFO, { title = "Macro" })
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		vim.notify("Macro gravada.", vim.log.levels.INFO, { title = "Macro", timeout = 500 })
	end,
})

-- Disable ZenMode when exiting to not mess with kitty fonts
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local ok, zen = pcall(require, "zen-mode")
		if ok then
			zen.close()
		end
	end,
	desc = "Desativa o Zen Mode ao sair do Neovim",
})

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

local markdown_keymaps_group = vim.api.nvim_create_augroup("MarkdownKeymaps", { clear = true })

local function minha_funcao_enter()

	local line = vim.api.nvim_get_current_line()
	local filepath = line:match("%((.-)%)") -- captura conteúdo entre parênteses
  local extension = vim.fn.fnamemodify(filepath, ":e")
  local full_path = vim.fn.expand(filepath)

  if string.sub(full_path, 1, 1) == '.' then
    full_path = vim.fs.joinpath(vim.fn.fnamemodify(vim.fn.expand('%:p'), ':h'), filepath)
  end

  local scaped_path = full_path:gsub(" ", "\\ ")

  print(full_path)
  print(full_path)

  if extension == "pdf" then
    vim.fn.jobstart({ "xdg-open", filepath }, { detach = true })
    return
  end

  vim.cmd("edit " .. scaped_path)

end

-- Cria o autocomando para o FileType 'markdown'
vim.api.nvim_create_autocmd("FileType", {
	group = markdown_keymaps_group,
	pattern = "markdown",
	callback = function(args)
		-- Mapeia a tecla <CR> (Enter) no modo de inserção
		vim.keymap.set("n", "<CR>", minha_funcao_enter, {
			buffer = args.buf, -- Aplica o mapeamento apenas ao buffer atual
			noremap = true,
			-- silent = true,  -- REMOVIDO para que o `print()` funcione
			desc = "Função customizada para Enter em Markdown",
		})
	end,
})
