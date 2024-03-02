return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      -- diagnostic disable: missing-fields
      require("ufo").setup({
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { "treesitter", "indent" }
        end,
      })

      require("ufo").openAllFolds()
    end,
  },
}
