-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>\\", "<C-w>v", { desc = "Split Window Right" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
