--------------------------------------------------------------------------------
-- Plugin Manager
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require('manu.plugins')
local opts = {}
require("lazy").setup(plugins, opts)
--------------------------------------------------------------------------------
require("manu.lualine")
require("manu.autocmds")
-- require("manu.galaxyline")
require("manu.lsp")
require("manu.treesitter")
require("manu.completion")
require("manu.keymaps")
require("manu.trouble")
require("manu.completion")
require("manu.telescope")
require("manu.statuscolumn")
require("manu.ibl")
require("nvim-web-devicons").get_icons()
require("nvim-web-devicons").setup()
require("manu.nvim-settings")
require('ufo').setup({})
require('ufo').openAllFolds()
require("bufferline").setup {}
require("gitsigns").setup()
--------------------------------------------------------------------------------
