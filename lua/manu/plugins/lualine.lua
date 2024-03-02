return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local function get_current_filetype()
        return vim.api.nvim_buf_get_option(0, 'filetype')
      end

      local function get_native_lsp()
        local buf_ft = get_current_filetype()
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return '' end
        local current_clients = ''
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            current_clients = current_clients .. client.name .. ' '
          end
        end
        return current_clients
      end
      --

      require("lualine").setup({
        options = {
          theme = "nordic",
          globalstatus = true,

        },
        sections = {
          lualine_x = {
            {
              "encoding",
            },
            {
              "fileformat"
            },
            {
              "filetype"
            },
            {
              get_native_lsp,
              padding = 1,
              separator = ' ',
              icon = { ' ' }
            },
          }
        }
        -- sections = {
        --   -- lualine_a = {
        --   --   'mode',
        --   --   fmt = fmt_mode,
        --   --   icon = { ' ' },
        --   --   -- separator = { right = ' ', left = '' },
        --   -- },
        --   -- lualine_b = {
        --   --   "branch",
        --   --   icon = { ' ' },
        --   --   -- separator = ' ',
        --   -- },
        --   -- lualine_c = {
        --   --   { "filename", path = 1 },
        --   -- },
        --   -- lualine_x = {
        --   --   {
        --   --     'diagnostics',
        --   --     sources = { 'nvim_diagnostic' },
        --   --     symbols = { error = ' ', warn = ' ', info = ' ', hint = '󱤅 ', other = '󰠠 ' },
        --   --     colored = true,
        --   --     padding = 2,
        --   --   },
        --   --   {
        --   --     get_native_lsp,
        --   --     padding = 1,
        --   --     separator = ' ',
        --   --     icon = { ' ' }
        --   --   },
        --   -- },
        --   -- lualine_z = {
        --   --   {
        --   --     'location',
        --   --     icon = { '', align = 'left' },
        --   --   },
        --   --   {
        --   --     'progress',
        --   --     icon = { '', align = 'left' },
        --   --   }
        --   -- }
        -- },
      })
    end
  }
}
