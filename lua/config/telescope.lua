require("telescope").setup {}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension "fzf"

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>;", ":Telescope buffers<CR>", { noremap = true, silent = true })

-- local function find_git_root()
--   local handle = io.popen "git rev-parse --show-toplevel 2> /dev/null"
--   local result = handle:read "*a"
--   handle:close() -- close process
--   result = result:gsub("%s+$", "") -- trim trailing whitespace
--   return result
-- end

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-p>",
--   ":Telescope find_files search_dirs={" .. '"' .. find_git_root() .. '"' .. "}<CR>",
--   { noremap = true, silent = true }
-- )
