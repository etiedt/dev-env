vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "_", "<cmd>Explore .<CR>")

vim.keymap.set("i", "<C-f>", "<Esc>")

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close split" })

-- Vim pane navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Conform
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format current buffer" })

-- Helpful Bindings
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- Quick Fix
vim.keymap.set("n", "<leader>q", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end, { desc = "Toggle Quickfix List" })

local function delete_qf_items()
    local mode = vim.api.nvim_get_mode()['mode']

    local start_idx
    local count

    if mode == 'n' then
        -- Normal mode
        start_idx = vim.fn.line('.')
        count = vim.v.count > 0 and vim.v.count or 1
    else
        -- Visual mode
        local v_start_idx = vim.fn.line('v')
        local v_end_idx = vim.fn.line('.')

        start_idx = math.min(v_start_idx, v_end_idx)
        count = math.abs(v_end_idx - v_start_idx) + 1

        -- Go back to normal
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes(
                '<esc>', -- what to escape
                true, -- Vim leftovers
                false, -- Also replace `<lt>`?
                true -- Replace keycodes (like `<esc>`)?
            ),
            'x', -- Mode flag
            false -- Should be false, since we already `nvim_replace_termcodes()`
        )
    end

    local qflist = vim.fn.getqflist()

    for _ = 1, count, 1 do
        table.remove(qflist, start_idx)
    end

    vim.fn.setqflist(qflist, 'r')
    vim.fn.cursor(start_idx, 1)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.keymap.set('n', 'dd', delete_qf_items, { buffer = true })
        vim.keymap.set('x', 'd', delete_qf_items, { buffer = true })
    end,
    desc = 'Quickfix Delete Items',
})
