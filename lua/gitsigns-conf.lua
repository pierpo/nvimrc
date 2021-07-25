require("gitsigns").setup {
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        -- Text objects
        ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
        ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
    }
}
