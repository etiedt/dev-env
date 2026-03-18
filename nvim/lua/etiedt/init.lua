require("etiedt.set")
require("etiedt.remap")

require("etiedt.lazy_init")

vim.g.netrw_banner = 0

-- Give syntac highlighting to .env files
vim.filetype.add({
  extension = {
    env = "sh",
  },
  filename = {
    [".env"] = "sh",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})
