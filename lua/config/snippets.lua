require("luasnip.loaders.from_snipmate").load()

vim.api.nvim_create_user_command("LuaSnippetEdit", function()
  filetype = vim.api.nvim_get_option_value("filetype", {})
  filetype_wildcard = "snippets/" .. filetype .. ".snippets"

  snippet_filename = vim.api.nvim_get_runtime_file(filetype_wildcard, false)[1]

  -- there is a cleaner way than this... but couldn't figure it out from
  -- the docs
  vim.api.nvim_command(":edit " .. snippet_filename)
end, { nargs = 0 })
