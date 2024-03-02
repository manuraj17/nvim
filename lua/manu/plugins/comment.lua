return {
  {
    "numToStr/Comment.nvim",
    event = { "BufEnter" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        -- require("ts_context_commentstring").setup({
        --   enable_autocmd = false,
        -- })
      end,
    },
    config = function()
      -- Comment configuration object _can_ take a partial and is merged in
      ---@diagnostic disable-next-line: missing-fields
      require("Comment").setup({})
    end,
  },
}