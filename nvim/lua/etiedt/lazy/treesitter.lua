return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "javascript",
                "lua",
                "rust",
                "bash",
                "python",
                "jsdoc",
                "c",
                "html",
                "yaml",
                "css",
                "dockerfile",
                "gitignore",
                "json",
                "markdown",
            },

            sync_install = true,

            auto_install = true,

            indent = {
                enable = true,
            },
        })

        vim.treesitter.language.register("bash", "zsh")
    end
}
