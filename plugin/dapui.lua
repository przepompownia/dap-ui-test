local dapui = require('dapui')
local dapuiInit = require('dapui.config.init')
local keymap = require 'vim.keymap'
local opts = {silent = true, noremap = true}
local function jumpToScopes()
  local winId = vim.fn.win_findbuf(vim.fn.bufnr('DAP Scopes'))[1]
  if nil == winId or not vim.api.nvim_win_is_valid(winId) then
    return
  end
  vim.api.nvim_set_current_win(winId)
end
keymap.set({'n'}, ',dt', dapui.toggle, opts)
keymap.set({'n'}, ',ds', jumpToScopes, opts)
keymap.set({'x'}, ',de', function() dapui.eval(nil, {enter = true, context = 'repl'}) end, opts)
dapui.setup({
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide IDs as strings or tables with "id" and "size" keys
      {
        id = dapuiInit.elements.SCOPES,
        size = 0.25, -- Can be float or integer > 1
        expand_long_lines = true,
      },
      { id = dapuiInit.elements.BREAKPOINTS, size = 0.25, expand_long_lines = false },
      { id = dapuiInit.elements.STACKS, size = 0.25, expand_long_lines = true },
      { id = dapuiInit.elements.WATCHES, size = 0.25, expand_long_lines = true },
    },
    size = 40,
    position = "left", -- Can be "left" or "right"
  },
})
