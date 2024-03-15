-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require("lazyvim.util")
local keymap = util.safe_keymap_set

-- toggle statusline
keymap("n", "<leader>l1", "<cmd>set laststatus=1<cr>", { noremap = true, silent = true, desc = "hide statusline" })
keymap("n", "<leader>l2", "<cmd>set laststatus=2<cr>", { noremap = true, silent = true, desc = "show statusline" })

-- toggle number line
keymap("n", "<leader>ln", function()
  vim.cmd("set number!")
  vim.cmd("set relativenumber!")
end, { noremap = true, silent = true, desc = "toggle number line" })

-- toggle highlight search
keymap("n", "<leader>hl", ":set hlsearch!<cr>", { noremap = true, silent = true, desc = "toggle [H]ighlight [S]earch" })

-- move cursor to bottom/top and center the screen
keymap("n", "H", "Hzz")
keymap("n", "L", "Lzz")
keymap("n", "G", "Gzz")

-- show file path of current buffer
keymap("n", "<leader>pwd", function()
  print(vim.fn.expand("%:p"))
end, { desc = "show current buffer file path" })
