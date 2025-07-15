return {
	"stevearc/conform.nvim",
	opts = {

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},

		formatters = {
			stylua = {
				prepend_args = { "--column-width", "130" },
			},
			prettier = {
				prepend_args = { "--print-width", "130" },
			},
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
