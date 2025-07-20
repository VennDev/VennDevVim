require "nvchad.options"

-- add yours here!
vim.opt.colorcolumn = "80"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.numberwidth = 4
vim.opt.scrolloff = 999
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#565d01' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#be4601' })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
