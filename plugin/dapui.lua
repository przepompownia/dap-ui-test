local dapui = require('dapui')
local keymap = require 'vim.keymap'
local opts = {silent = true, noremap = true}
keymap.set({'n'}, ',dt', dapui.toggle, opts)
keymap.set({'x'}, ',de', function() dapui.eval(nil, {enter = true, context = repl}) end, opts)
dapui.setup({})
