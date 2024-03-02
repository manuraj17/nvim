--------------------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------------------
-- require("nvim-ts-autotag").setup({
--   filetypes = {
--     "html",
--     "htmldjango",
--     "javascript",
--     "javascript.tsx",
--     "javascriptreact",
--     "typescript",
--     "typescript.tsx",
--     "typescriptreact",
--     "svelte",
--     "vue",
--   },
-- })

require("nvim-treesitter.configs").setup {
  auto_install = true,
  ensure_installed = {},
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "rust" },
  },
  endwise = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {
      -- "ruby",
      "python"
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    colors = {
      "#c2c2c2",
      "#a89984",
      "#b16286",
      "#689d6a",
      "#457188",
      "#d79921",
      "#d65d0e",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '+',
      scope_incremental = '<c-s>',
      node_decremental = '-',
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
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
  textobjects = {
    select = {
      enable = true,
      lookaheaad = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
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
  },
}
