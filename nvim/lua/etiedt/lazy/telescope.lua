return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<Esc>"] = actions.close,
						["<C-n>"] = actions.preview_scrolling_down,
						["<C-p>"] = actions.preview_scrolling_up,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files in cwd" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in cwd" }
		)
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		vim.keymap.set("n", "<leader>tf", function()
			require("telescope.builtin").lsp_document_symbols({ symbols = { "method", "function" } })
		end, { desc = "Find functions" })
	end,
}
