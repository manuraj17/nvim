return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        cond = vim.fn.executable("cmake") == 1,
      },
      { "nvim-telescope/telescope-project.nvim" }
      -- { "ahmedkhalf/project.nvim", lazy = false }
    },
    config = function()
      local ts = require 'telescope'
      -- TODO: Configure more for projects
      --  https://github.com/nvim-telescope/telescope-project.nvim
      ts.load_extension 'project'
      ts.load_extension 'notify'
      ts.load_extension 'fzf'

      local border_chars_outer_thin_telescope = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼' }
      local border_chars_outer_thick_telescope = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' }

      ts.setup {
        defaults = {
          sort_mru = true,
          sorting_strategy = 'ascending',
          layout_config = { prompt_position = 'top' },
          borderchars = {
            prompt = { '▔', '▕', ' ', '▏', '🭽', '🭾', '▕', '▏' },
            results = border_chars_outer_thin_telescope,
            preview = border_chars_outer_thick_telescope,
          },
          border = true,
          multi_icon = '',
          entry_prefix = '   ',
          prompt_prefix = '   ',
          selection_caret = '  ',
          hl_result_eol = true,
          results_title = '',
          winblend = 0,
          wrap_results = false,
          mappings = { n = { ['q'] = require('telescope.actions').close } },
          file_ignore_patterns = {
            "node_modules",
            "yarn.lock",
            ".git",
            ".sl",
            "_build",
            ".next",
          }
          -- mappings = { i = { ['<Esc>'] = require('telescope.actions').close } },
        },
        extensions = {
          project = {}
        }
      }


      -- Enable telescope fzf native, if installed
      -- pcall(require("telescope").load_extension, "fzf")
    end
  }
}
