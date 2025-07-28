require("telescope").setup {}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension "fzf"

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>;", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gt", ":Telescope live_grep<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "π",
  ":Telescope find_files hidden=true no_ignore=true<CR>",
  { noremap = true, silent = true }
)
