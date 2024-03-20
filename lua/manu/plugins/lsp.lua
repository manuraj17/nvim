return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
      -- Plugin and UI to automatically install LSPs to stdpath
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Install lsp autocompletions
      "hrsh7th/cmp-nvim-lsp",

      -- Install none-ls for diagnostics, code actions, and formatting
      "nvimtools/none-ls.nvim",

      -- Install neodev for better nvim configuration and plugin authoring via
      -- lsp configurations
      -- "folke/neodev.nvim",

      -- Progress/Status update for LSP
      { "j-hui/fidget.nvim",         tag = "legacy" },
      --
      { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { "hrsh7th/cmp-buffer" }, -- source for text in buffer
      { "hrsh7th/cmp-path" },   -- source for file system paths
      { "saadparwaiz1/cmp_luasnip" },
      { 'RaafatTurki/corn.nvim' },
    },
    config = function()
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

      local cmp_symbol_map = {
        Boolean = "",
        Character = "",
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "ﳅ",
        Field = "",
        File = "",
        Folder = "ﱮ",
        Function = "ﬦ",
        Interface = "",
        Keyword = "",
        Method = "",
        Module = "",
        Number = "",
        Operator = "Ψ",
        Parameter = "",
        Property = "ﰠ",
        Reference = "",
        Snippet = "",
        String = "",
        Struct = "ﯟ",
        Text = "",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "ﳛ",
        Copilot = ""
      }

      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- ensure_installed = {'tsserver', 'rust_analyzer'},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
            require('lspconfig').rust_analyzer.setup({})
            require('lspconfig').ocamllsp.setup({})
            require('lspconfig').gopls.setup({})
          end,
        }
      })

      --------------------------------------------------------------------------------
      -- Completion
      --------------------------------------------------------------------------------

      -- import nvim-cmp plugin safely
      local cmp_status, cmp = pcall(require, "cmp")
      if not cmp_status then
        return
      end

      -- import luasnip plugin safely
      local luasnip_status, luasnip = pcall(require, "luasnip")
      if not luasnip_status then
        return
      end
      require("luasnip.loaders.from_vscode").lazy_load()

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      cmp.setup({
        preselect = 'none',

        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP
          { name = "luasnip" },  -- snippets
          { name = "buffer" },   -- text within the current buffer
          { name = "path" },     -- file system paths
        }),

        window = {
          completion = {
            -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            border = border "CmpBorder",
          },
          documentation = {
            max_height = 15,
            max_width = 60,
            -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            border = border "CmpDocBorder",
            scrollbar = "║",
            col_offset = 0,
            side_padding = 1,
            zindex = 1001
          },
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.menu_hl_group = "CmpItemKind" .. vim_item.kind
            vim_item.menu = vim_item.kind
            vim_item.abbr = vim_item.abbr:sub(1, 50)
            vim_item.kind = '[' .. cmp_symbol_map[vim_item.kind] .. ']'
            return vim_item
          end,
        },

        experimental = {
          native_menu = false,
          ghost_text = true,
        },
      })
    end
  }
}
