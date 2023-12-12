-- Configures
-- 1. Globals
-- 2. Options
-- 3. Colorschemes

-- #region Globals
vim.g.t_co = 256
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.everforest_background = 'dark'
-- #endregion

--#region Disable builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
--#endregion

--#region Options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.pumheight = 30
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.syntax = "ON"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cmdheight = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80,100,120"
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
-- fold config in folding.lua
vim.opt.foldlevel = 999
-- vim.opt.foldcolumn = '1'
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true
vim.opt.list = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.scrolloff = 4
vim.opt.relativenumber = true
vim.opt.background = "dark"

vim.opt.path:remove "/usr/include" -- Better search
vim.opt.path:append "**"           -- Better search
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.git/*"

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↡"
--#endregion

-- themes = {
--     "gruvbox",
--     "alchemist",
--     "nordic",
--     "oxocarbon",
--     "aquarium",
--     "everforest",
--     "habamax",
--     "mellifluous",
--     "kanagawa-dragon",
--     "doom-one"
-- }
-- --
-- function apply(id)
--
-- end
--
-- apply(1)
-- vim.cmd("colorscheme " .. themes[id])

-- vim.cmd [[ colorscheme grey]]
-- vim.cmd [[ colorscheme doom-one]]
-- vim.cmd [[ colorscheme sherbet]]
vim.cmd [[ colorscheme nordic]]
-- vim.cmd([[au ColorScheme * hi Normal guibg=#222222]])


