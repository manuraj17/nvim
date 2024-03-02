return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      local u = require("manu.utils")
      require('noice').setup {
        cmdline = {
          format = {
            cmdline = { title = '', icon = ' ' },
            lua = { title = '', icon = '󰢱 ' },
            help = { title = '', icon = '󰋖 ' },
            input = { title = '', icon = ' ' },
            filter = { title = '', icon = ' ' },
            search_up = { icon = '    ' },
            search_down = { icon = '    ' },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = u.border_chars_round,
              padding = { 0, 2 },
            },
            position = {
              row = '49%',
              col = '50%',
            },
          },
        },
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
          signature = { enabled = false, view = 'virtualtext' },
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      }
    end
  },
}
