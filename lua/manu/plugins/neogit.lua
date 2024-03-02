return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",                    -- required
      "nvim-telescope/telescope.nvim",            -- optional
      -- { "sindrets/diffview.nvim", lazy = false }, -- optional
      { "ibhagwan/fzf-lua",       lazy = false }  -- optional
    },
    config = true,
    opts = {
      disable_hint = false,
      disable_signs = false,
      disable_line_numbers = false,
      console_timeout = 15000,
      status = {
        recent_commit_count = 50,
      },
      graph_style = "unicode",
      signs = {
        hunk = { "", "" },
        item = { " ", " " },
        section = { " ", " " },
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  },
}
