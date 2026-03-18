--vim.cmd("let g:netrw_liststyle = 3") -- Tree style directory display

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undotree = os.getenv("HOME") .. "/vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
	virtual_text = true,
})
vim.cmd([[highlight DiagnosticVirtualTextError guibg=#1a212e]])
vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=#1a212e]])
vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=#1a212e]])
vim.cmd([[highlight DiagnosticVirtualTextHint guibg=#1a212e]])

