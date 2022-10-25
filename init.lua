-- Custom util methods
local function enable_flags(mode, config)
  for k, v in pairs(config) do
    vim[mode][k] = v
  end
end

local globals = {
  t_co = 256,
  background = "dark",
  netrw_banner = 0,
  netrw_winsize = 30,
}

enable_flags('g', globals)

-- References
-- https://mattermost.com/blog/how-to-install-and-set-up-neovim-for-code-editing/

-- [[ opts.lua ]]
local options = {
  termguicolors = true,
  number = true,
  mouse = "a",
  pumheight = 30,
  showmode = true,
  showtabline = 2,
  smartindent = true,
  swapfile = false,
  undofile = true,
  cursorline = true,
  signcolumn = "yes",
  ignorecase = true,
  smartcase = true,
  hlsearch = false,
  tabstop = 2,
  shiftwidth = 2,
  syntax = "ON",
  completeopt = { "menuone", "noselect" },
  cmdheight = 1,
  clipboard = "unnamedplus",
  colorcolumn = "80,100,120",
  encoding = "utf8",
  fileencoding = "utf8",
  expandtab = true,
  splitbelow = true,
  splitright = true,
  foldlevel = 0,
  -- foldcolumn = '1',
  foldlevelstart = 99,
  foldenable = true
  -- list = true
}

enable_flags('opt', options)

--[[ keys.lua ]]
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- Example:
-- map("n", "<space>w", "<cmd>write<cr>", { desc = "Save" })
local map = vim.api.nvim_set_keymap

map("n", "<space>s", ":PackerSync<CR>", { desc = "Update packages" })

--[[ plugins-manager.lua ]]
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print "Installing packer..."
  local packer_url = "https://github.com/wbthomason/packer.nvim"
  vim.fn.system { "git", "clone", "--depth", "1", packer_url, install_path }
  print "Done."

  vim.cmd "packadd packer.nvim"
  install_plugins = true
end

--[[ plugins.lua ]]
require("packer").startup(function(use)
  -- Package manager
  use "wbthomason/packer.nvim"

  use { "nvim-lua/plenary.nvim" }

  -- UI Spice
  use "kyazdani42/nvim-web-devicons"

  -- LSP Stuff
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- Tree Sitter et al
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "RRethy/nvim-treesitter-textsubjects"
  use 'nvim-treesitter/playground'
  use "RRethy/nvim-treesitter-endwise"

  -- use 'joshdick/onedark.vim'
  -- use "lewpoly/sherbet.nvim"
  -- use "sainnhe/sonokai"
  -- use "edeneast/nightfox.nvim"
  use "NTBBloodbath/doom-one.nvim"

  -- Status lines
  -- Replace this with custom
  use({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- some optional icons
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })

  -- Comments
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {}
    end,
  })

  -- Telescope et al
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "LinArcX/telescope-env.nvim" },
    },
  }

  -- Auto close
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  -- OG Vinegar
  use "tpope/vim-vinegar"

  use "lewis6991/gitsigns.nvim"

  -- Autcompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- format plugin worth looking into
  --https://github.com/lukas-reineke/lsp-format.nvim

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  }

  use {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  }

  -- use {
  --   "folke/which-key.nvim",
  -- }

  use "RRethy/vim-illuminate"

  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup({})
    end,
  }

  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- Open in github
  -- use "almo7aya/openingh.nvim"

  -- View vim registry values
  -- use "gennaro-tedesco/nvim-peekup"

  -- folding
  -- Quick Reference:
  -- zo: Open fold under cursor
  -- zc: Close fold under cursor
  -- zM: Close all
  -- zR: Open all
  -- https://github.com/kevinhwang91/nvim-ufo
  use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }

  -- use { "jose-elias-alvarez/null-ls.nvim" }

  -- LSP Plugin to explore
  -- use { "glepnir/lspsaga.nvim" }

  -- Highlighting for text files
  -- https://github.com/lukas-reineke/headlines.nvim
  use {
    'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup()
    end,
  }

  -- which key plugin
  --azytanuki/nvim-mapper

  -- Fancy indent highlights
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use "lukas-reineke/indent-blankline.nvim"

  -- LSP loading status
  -- use "j-hui/fidget.nvim"

  -- use 'SidOfc/carbon.nvim'
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = { "kkharji/sqlite.lua" }
  }


  -- Highlight yanked location
  -- use "machakann/vim-highlightedyank"

  -- Surround stuff
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })


  -- Quick movement, this requires repeat
  use "tpope/vim-repeat"
  use "ggandor/leap.nvim"

  -- use "woosaaahh/sj.nvim"
  if install_plugins then
    require("packer").sync()
  end
end)

if install_plugins then
  return
end

require("nvim-web-devicons").get_icons()
require("nvim-web-devicons").setup()

require("nvim-treesitter.configs").setup {
  auto_install = true,
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
}



-- nvim-cmp setup
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  print("Failed to load cmp")
  return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
  print("Failed to load luasnip")
  return
end

-- https://github.com/Alexis12119/nvim-config/blob/master/lua/user/plugins/cmp.lua
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered {
      border = "rounded",
      -- winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search",
      col_offset = -3,
      side_padding = 1,
    },
    documentation = cmp.config.window.bordered {
      border = "rounded",
      -- winhighlight = "Normal:Normal,FloatBorder:CmpDocumentationBorder,CursorLine:CmpCursorLine,Search:Search",
      col_offset = -3,
      side_padding = 1,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmdline = { '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
    }, {
      { name = 'buffer' }
    })
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.foldinRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

vim.keymap.set("n", "tt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "td", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "tl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "tq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "tr", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.server_capabilities["documentSymbolProvider"] then
    navic.attach(client, bufnr)
  end
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

require("lspconfig").jsonls.setup {
  on_attach = on_attach,
  lsp_flags = lsp_flags,
  capabilities = capabilities
}

require("lspconfig").solargraph.setup {
  on_attach = on_attach,
  lsp_flags = lsp_flags,
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  capabilities = capabilities
}

require("lspconfig").sumneko_lua.setup {
  -- handlers = handlers,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Zen mode with `zn`
vim.api.nvim_set_keymap("n", "<space>zn", ":TZAtaraxis<CR>", {})

vim.cmd [[ colorscheme doom-one]]

-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↡"
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

-- Currently turning it off for noice
-- require("fidget").setup({})

-- Custom lspconfig
-- local hw = function()
--    print "Enter buffer"
-- end
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--    pattern = { "*" },
--    callback = hw,
-- })
--

-- Galaxyline
-- https://github.com/glepnir/nvim/blob/main/lua/modules/ui/eviline.lua
local status_ok, galaxyline = pcall(require, 'galaxyline')
if not status_ok then
  return
end

local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = galaxyline.section
galaxyline.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer', 'lspsagaoutline' }

gls.left[1] = {
  RainbowRed = {
    provider = function()
      return '▊ '
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        ['!'] = colors.red,
        [''] = colors.blue,
        [''] = colors.orange,
        ['r?'] = colors.cyan,
        c = colors.magenta,
        ce = colors.red,
        cv = colors.red,
        i = colors.green,
        ic = colors.yellow,
        n = colors.red,
        no = colors.red,
        r = colors.cyan,
        R = colors.violet,
        rm = colors.cyan,
        Rv = colors.violet,
        s = colors.orange,
        S = colors.orange,
        t = colors.red,
        v = colors.blue,
        V = colors.blue,
      }
      vim.api.nvim_command(
        'hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg
      )
      return '  '
    end,
  },
}

gls.left[3] = {
  FileSize = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg },
    provider = 'FileSize',
  },
}

gls.left[6] = {
  LineInfo = {
    highlight = { colors.fg, colors.bg },
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.left[7] = {
  PerCent = {
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.left[8] = {
  DiagnosticError = {
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiagnosticError',
  },
}

gls.left[9] = {
  DiagnosticWarn = {
    highlight = { colors.yellow, colors.bg },
    icon = '  ',
    provider = 'DiagnosticWarn',
  },
}

gls.left[10] = {
  DiagnosticHint = {
    highlight = { colors.cyan, colors.bg },
    icon = '  ',
    provider = 'DiagnosticHint',
  },
}

gls.left[11] = {
  DiagnosticInfo = {
    highlight = { colors.blue, colors.bg },
    icon = '  ',
    provider = 'DiagnosticInfo',
  },
}

gls.mid[1] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.yellow, colors.bg, 'bold' },
    icon = ' LSP:',
    provider = 'GetLspClient',
  },
}

gls.mid[1] = {
  FileIcon = {
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
    provider = 'FileIcon',
  },
}

gls.mid[2] = {
  FileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'FileName',
  },
}

gls.mid[3] = {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.mid[4] = {
  GitBranch = {
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
    provider = 'GitBranch',
  },
}

gls.right[1] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.yellow, colors.bg, 'bold' },
    icon = ' LSP:',
    provider = 'GetLspClient',
  },
}

gls.right[2] = {
  FileEncode = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, 'bold' },
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[3] = {
  FileFormat = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, 'bold' },
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[4] = {
  Separator = {
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = function()
      return ' '
    end,
  },
}

gls.right[5] = {
  DiffAdd = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg },
    icon = '  ',
    provider = 'DiffAdd',
  },
}

gls.right[6] = {
  DiffModified = {
    condition = condition.hide_in_width,
    highlight = { colors.orange, colors.bg },
    icon = ' 柳',
    provider = 'DiffModified',
  },
}

gls.right[7] = {
  DiffRemove = {
    condition = condition.hide_in_width,
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiffRemove',
  },
}

gls.right[8] = {
  RainbowBlue = {
    provider = function()
      return ' ▊'
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    highlight = { colors.blue, colors.bg, 'bold' },
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'SFileName',
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    highlight = { colors.fg, colors.bg },
    provider = 'BufferIcon',
  },
}



-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>g', builtin.live_grep, {})
vim.keymap.set('n', '<space>bb', builtin.buffers, {})
vim.keymap.set('n', '<space>th', builtin.help_tags, {})
vim.keymap.set('n', '<space>tc', builtin.command_history, {})
vim.keymap.set('n', '<space>tg', builtin.git_commits, {})
vim.keymap.set('n', '<space>tgs', builtin.git_status, {})
vim.keymap.set('n', '<space>tgb', builtin.git_branches, {})
vim.keymap.set('n', '<space>tls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<space>tld', builtin.lsp_definitions, {})

vim.api.nvim_set_keymap("n", "<space><space>",
  "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
  { noremap = true, silent = true })

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]


require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer" }
})

-- Plugins with default configuration
require('ufo').setup({})
require('ufo').openAllFolds()

require("bufferline").setup {}
require('leap').add_default_mappings()

require("gitsigns").setup()

require("mason").setup()

-- which key prompt
-- This is messing with visual mode, pressing v doesn't take to visual mode
-- require("which-key").setup {}
