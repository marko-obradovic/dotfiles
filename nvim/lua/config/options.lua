local opt = vim.opt -- Shortcut for setting options

-- Basic settings
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true -- highlight current line
opt.wrap = true -- wrap long lines
opt.signcolumn = "yes" -- always show sign column

-- Tabs & indentation
opt.tabstop = 2 -- width of a tab character
opt.softtabstop = 2 -- spaces inserted when pressing Tab
opt.shiftwidth = 2 -- spaces for autoindent and >>/<<
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- copy indent from previous line

-- True color
opt.termguicolors = true -- enable 24-bit color support

-- Change the color of the line number of the current line
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebdbb2", bg = "#504945", bold = true })
	end,
})
-- Normal mode, pressing <leader>h clears search highlight
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true })
