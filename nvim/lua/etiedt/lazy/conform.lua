return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			lua = { "stylua" },
			javascript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			log_level = vim.log.levels.DEBUG,
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "ruff", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = {
					{
						"prettier",
						extra_args = { "--tab-width", "4" },
					},
				},
			},
		})
	end,
}
