return {
  --#region LSP and Completion
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { "hrsh7th/cmp-buffer" }, -- source for text in buffer
  { "hrsh7th/cmp-path" },   -- source for file system paths
  { "saadparwaiz1/cmp_luasnip" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  --#endregion

  --#region Highlight, edit, and navigate code
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "RRethy/vim-illuminate",
      "RRethy/nvim-treesitter-endwise"
    },
    -- config = function()
    --  pcall(require('nvim-treesitter.install').update { with_sync = true })
    -- end,
  },
  -- For html tag autocompletion
  { "windwp/nvim-ts-autotag" },
  -- split and join
  {
    'Wansmer/treesj',
    -- keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup()
    end,
  },
  { "rktjmp/highlight-current-n.nvim" },
  --#endregion

  --#region DAP
  -- { "mfussenegger/nvim-dap" },
  --#endregion

  --#region Color themes
  {
    "ramojus/mellifluous.nvim",
    dependencies = { 'rktjmp/lush.nvim' },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      contrast = "soft"
    },
  },
  -- {
  --   'deparr/tairiki.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('tairiki').setup {
  --       style='light'
  --     }
  --     require('tairiki').load()
  --   end,
  -- },
  -- 'joshdick/onedark.vim'
  -- { "lewpoly/sherbet.nvim" },
  -- { dir = "/Users/manu/Code/github/manuraj17/sherbet.nvim" },
  -- { dir = "/Users/manu/Code/github/nvim-grey" },
  -- "sainnhe/sonokai"
  -- "edeneast/nightfox.nvim"
  -- "NTBBloodbath/doom-one.nvim"
  { "habamax/vim-alchemist" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "sainnhe/everforest" },
  { "frenzyexists/aquarium-vim" },
  { "AlexvZyl/nordic.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/seoul256.nvim" },
  { "Th3Whit3Wolf/space-nvim" },
  { "Th3Whit3Wolf/one-nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.g.doom_one_plugin_neogit = true
    end
  },
  {
    "NTBBloodbath/doom-one.nvim",
    priority = 1000
  },
  {
    "ronisbr/nano-theme.nvim",
    init = function()
      vim.o.background = "light" -- or "dark".
    end
  },
  "lewpoly/sherbet.nvim",
  {
    'kaiuri/nvim-juliana',
    lazy = false,
    opts = {
      colors = {
        bg1          = '#444e59',
        bg2          = '#303841',
        bg3          = '#2e353e',
        blue1        = '#95b2d6',
        blue2        = '#5c99d6',
        cyan1        = '#87c7c7',
        cyan2        = '#5fb4b4',
        diff_add     = '#41525a',
        diff_change  = '#585249',
        diff_remove  = '#4f434a',
        diff_text    = '#373f48',
        fg1          = '#ffffff',
        fg2          = '#d8dee9',
        fg3          = '#a6acb9',
        fg4          = '#46525c',
        green        = '#99c794',
        magenta      = '#c695c6',
        orange       = '#f97b58',
        red1         = '#c76b70',
        red2         = '#ec5f66',
        selection_bg = '#3f4750',
        text_fg      = '#d9d9d9',
        yellow1      = '#fac761',
        yellow2      = '#f9ae58',
        yellow3      = '#ee932b',
      }
    },
    config = true,
  },
  -- { "yorickpeterse/nvim-grey" },
  -- Install without configuration
  -- Or with configuration
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      -- vim.cmd('colorscheme github_light_tritanopia')
    end,
  },
  --#endregion

  --#region Statusline
  -- {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   -- some optional icons
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    "MunifTanjim/nougat.nvim",
  },
  --#endregion

  --#region Commentary
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  --#endregion

  --#region Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  --#endregion


  --#region Auto close
  {
    "windwp/nvim-autopairs",
    dependencies = {},
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  {
    "gpanders/nvim-parinfer"
  },
  --#endregion

  --#region Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  --#endregion


  --#region clipboard manager
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    }
  },
  --#endregion

  --#region File Navigation
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  --#endregion

  --#region Git
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      -- "sindrets/diffview.nvim",      -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  --#endregion

  --#region DiagnosticInfo
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }
  },
  --#endregion

  --#region UI Spice
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- }
{ "rcarriga/nvim-notify"} ,
{
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  --#endregion

  --#region Indentation highlight
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  --#endregion

  --#region Folding
  -- Quick Reference:
  -- zo: Open fold under cursor
  -- zc: Close fold under cursor
  -- zM: Close all
  -- zR: Open all
  -- https://github.com/kevinhwang91/nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }
  },
  --#endregion


  --#region Misc
  {
    'folke/which-key.nvim',
    opts = {}
  },
  --#endregion

  --#region Test Runners
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python"
    }
  },

  --#endregion


  --#region Git

  --#endregion

  { "nvimtools/none-ls.nvim" },

  --#region
  { "luukvbaal/statuscol.nvim" },
  --#endregion
  -- {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   -- some optional icons
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  { 'akinsho/bufferline.nvim',            version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup()
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
      --
    },
  },
}
