-- Configures
-- 1. Globals
-- 2. Options
-- 3. Colorschemes

-- #region Globals
vim.g.t_co = 256
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- vim.g.gruvbox_baby_keyword_style = "NONE"
-- vim.g.everforest_background = 'dark'
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

-- Enable mouse mode
vim.opt.mouse = "a"
vim.opt.pumheight = 30
vim.opt.showmode = true
vim.opt.showtabline = 2

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Tab spac 2
vim.opt.tabstop = 2
-- If you want to keep the default stab stop size but edit the file if the tab
-- stop value as some other value. The value of softtabstop equals how many 
-- columns the cursor moves right when you press <Tab> and back when you press
-- <backspace>
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- For auto indenting
-- Amount of whitespace used for one level of indendation
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false

vim.opt.syntax = "ON"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cmdheight = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80,100,120"
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- fold config in folding.lua, for ufo plugin
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 999
vim.opt.foldlevelstart = 999
vim.opt.foldenable = true

vim.opt.list = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.scrolloff = 8

-- vim.opt.background = "dark"
vim.opt.background = "light"

-- For better searching 
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.path:remove "/usr/include" -- Better search
vim.opt.path:append "**"           -- Better search
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.git/*"

-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↡"
-- vim.opt.listchars:append "eol:⏎"
-- vim.opt.listchars:append "tab:>-"
-- vim.opt.listchars:append "nbsp:⎵"
-- vim.opt.listchars:append "trail:␠,"
--#endregion

-- Relative line numbers
vim.opt.rnu = true
vim.opt.nu = true


-- Decrease updatetime to 200ms
vim.opt.updatetime = 50


