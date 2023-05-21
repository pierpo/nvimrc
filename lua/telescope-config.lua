require("telescope").setup {}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true, silent = true})
