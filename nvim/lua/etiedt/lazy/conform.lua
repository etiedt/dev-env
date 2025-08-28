--return {
--    "stevearc/conform.nvim",
--    opt = {
--        formatters_by_ft = {
--            lua = { "stylua", lsp_format = "fallback" },
--            pyhton = { "isort", "black", lsp_format = "fallback" },
--            javascript = { "prettier", lsp_format = "fallback" },
--        },
--        format_on_save = {
--            -- These options will be passed to conform.format()
--            timeout_ms = 500,
--            lsp_format = "fallback",
--        },
--    },
--}

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
				javascript = { "prettier" },
			},
		})
	end,
}
