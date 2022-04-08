local dapui = require('dapui')
local keymap = require 'vim.keymap'
local opts = {silent = true, noremap = true}
local function jumpToScopes()
  vim.api.nvim_set_current_win(vim.fn.win_findbuf(vim.fn.bufnr('DAP Scopes'))[1])
end
keymap.set({'n'}, ',dt', dapui.toggle, opts)
keymap.set({'n'}, ',ds', jumpToScopes, opts)
keymap.set({'x'}, ',de', function() dapui.eval(nil, {enter = true, context = 'repl'}) end, opts)
dapui.setup({})
