-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.keymaps")
require("config.options")
require("config.lazy")
-- enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
