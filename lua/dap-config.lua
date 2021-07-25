require("telescope").load_extension("dap")

vim.api.nvim_set_keymap("n", "<leader>dc", ":Telescope dap commands<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>dv", ":lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dap').repl.open()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", {})

vim.api.nvim_set_keymap("n", "<F8>", ":lua require('dap').continue()<CR>", {})
vim.api.nvim_set_keymap("n", "<F10>", ":lua require('dap').step_over()<CR>", {})
vim.api.nvim_set_keymap("n", "<F11>", ":lua require('dap').step_into()<CR>", {})
vim.api.nvim_set_keymap("n", "<F12>", ":lua require('dap').step_out()<CR>", {})

local dap = require("dap")

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/projects/vscode-node-debug2/out/src/nodeDebug.js"}
}

nodeConf = {
    {
        name = "node",
        type = "node2",
        request = "attach",
        hostname = "127.0.0.1",
        port = "9229",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal"
    }
}

dap.configurations.typescript = nodeConf
dap.configurations.typescriptreact = nodeConf
dap.configurations.javascript = nodeConf
dap.configurations.javascriptreact = nodeConf

vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpoint', {text='⭕️', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⛔️', texthl='', linehl='', numhl=''})
