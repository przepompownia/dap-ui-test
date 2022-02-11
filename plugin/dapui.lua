local dapui = require('dapui')
local keymap = require 'vim.keymap'
local opts = {silent = true, noremap = true}
keymap.set({'n'}, ',dt', dapui.toggle, opts)
keymap.set({'x'}, ',de', dapui.eval, opts)
dapui.setup({})
