require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Toggle Floaterm in normal and terminal modes
map({ "n", "t" }, "<leader>t", "<CMD>FloatermToggle<CR>", { desc = "Toggle Floaterm" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
