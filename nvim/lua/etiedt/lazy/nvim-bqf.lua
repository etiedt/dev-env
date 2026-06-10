-- https://github.com/kevinhwang91/nvim-bqf#customize-configuration
return {
    "kevinhwang91/nvim-bqf",
    ft = "qf",

    config = function ()
        require("bqf").setup({
            auto_enable = true,
            auto_resize_height = true,
            func_map = {
                open = "o", -- open item
                openc = "O", -- open item and close quick fix 
                vsplit ="t", -- open in vertical split
                stoggleup = "<S-Tab>", -- toggle sign and move up an item
                stoggledown = "<Tab>", -- toggle sign and move down an item
                stogglevm = "<Tab>", -- toggle sign of multiple in visual mode
                stogglebuf = "b<Tab>", -- toggle sign of items in same buffer
                sclear = "z<Tab>", -- clear signs in current list
                ptogglemode = "zp", -- toggle between preivew zoom
                ptoggleitem = "p", -- toggle preview for an item
                ptoggleauto = "P", -- toggle auto preview
                -- unmapped functions
                drop = "",
                tabdrop = "",
                tab = "",
                tabb = "",
                tabc = "",
                split = "",
                prevfile = "",
                nextfile = "",
                prevhist = "",
                nexthist = "",
                lastleave = "",
                pscrollup = "",
                pscrolldown = "",
                pscrollorig = "",
                filter = "",
                filterr = "",
                fzffilter = "",
            },
        })
    end,
}
