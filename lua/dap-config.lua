require("telescope").load_extension("dap")

local buf_map = vim.api.nvim_buf_set_keymap
buf_map(bufnr, "n", "<leader>d", ":Telescope dap commands<CR>", {})
