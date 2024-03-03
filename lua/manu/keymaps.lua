-- General keymaps for the editor functions
-- Plugin keymaps are not included here

--#region Keymaps
vim.g.mapleader = " "

-- Shift lines up and down using J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- https://github.com/jchilders/dotfiles/blob/main/xdg_config/nvim/lua/core/mappings.lua
-- Prevent `Q` from taking us into Ex mode because this isn't 1980
vim.keymap.set("n", "Q", "<NOP>")

-- center screen after search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- better up/down
vim.keymap.set(
  "n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }
)
vim.keymap.set(
  "n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }
)
-- vim.keymap.set("i", "A-j", ":m '>+1<CR>gv-gv", { expr = true, silent = true })
-- vim.keymap.set("i", "A-k", ":m '<-2<CR>gv-gv", { expr = true, silent = true })

-- Switch buffers with <shift> hl
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  { desc = "Escape and clear hlsearch" }
)

-- Clear search and redraw
vim.keymap.set(
  "n",
  "<leader>r",
  "<cmd>noh<cr><cmd>redraw<cr><c-l>",
  { desc = "Redraw and clear hlsearch" }
)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
