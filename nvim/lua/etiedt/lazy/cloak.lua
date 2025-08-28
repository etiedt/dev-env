return {
	"laytan/cloak.nvim",

	config = function()
		require("cloak").setup({
			enable = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
					},
					cloak_pattern = "=.+",
				},
			},
		})
	end,
}
