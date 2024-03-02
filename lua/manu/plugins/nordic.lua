return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        theme = "nordic",
        -- https://github.com/AlexvZyl/nordic.nvim/issues/49
        override = {
          Visual = {
            bg = "#3A515D", -- Choose a color you like.,
            -- bg = "#BF616A", -- Choose a color you like.,
            bold = false,   -- Or false.,
          },
        },
      })

      require("nordic").load()
    end
  },
}
