return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufEnter" },
    dependencies = {
      -- Additional text objects for treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "RRethy/vim-illuminate",
      "RRethy/nvim-treesitter-endwise",
      "Wansmer/treesj"
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        auto_install = true,
        ensure_installed = {},
        sync_install = false,
        ignore_install = { "" },
        highlight = {
          enable = true,
          disable = { "rust" },
        },
        -- Disabling endwise as am not writing ruby at the moment
        -- endwise = {
        --   enable = true,
        -- },
        indent = {
          enable = true,
          -- There is some ongoing issue with python, haven't yet checked it
          disable = {
            -- "ruby",
            "python"
          }
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      }

      require("treesj").setup({})
    end
  }
}
