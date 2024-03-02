local viex = {}

vim.api.nvim_create_user_command("Viex", function()
  input = vim.fn.input("Title: ")
  vim.cmd(string.format("80vnew /tmp/%s.md", input))
end, {})


return viex
