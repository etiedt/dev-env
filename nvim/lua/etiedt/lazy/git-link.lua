return {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {
        router = {
            default_branch = {
                ["^gitlab.xes%-mad%.com"] = "https://gitlab.xes-mad.com/"
                    .. "{_A.ORG}/"
                    .. "{_A.REPO}/-/blob/"
                    .. "{_A.DEFAULT_BRANCH}/"
                    .. "{_A.FILE}"
                    .. "?#L{_A.LSTART}"
                    .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
            },
        },
    },
    keys = {
      { "<leader>gl", "<cmd>GitLink default_branch<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gL", "<cmd>GitLink! default_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
}
