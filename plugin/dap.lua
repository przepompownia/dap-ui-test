local dap = require 'dap'
local keymap = require 'vim.keymap'
local widgets = require('dap.ui.widgets')
local utils = require('dap.utils')

local opts = {silent = true, noremap = true}
keymap.set({'x'}, ',dh', function() widgets.hover(utils.get_visual_selection_text) end, opts)
keymap.set({'n'}, ',dv', dap.step_over, opts)
keymap.set({'n'}, ',di', dap.step_into, opts)
keymap.set({'n'}, ',do', dap.step_out, opts)
keymap.set({'n'}, ',db', dap.toggle_breakpoint, opts)
keymap.set({'n'}, ',dc', dap.continue, opts)
keymap.set({'n'}, ',du', dap.up, opts)
keymap.set({'n'}, ',dd', dap.down, opts)
keymap.set({'n'}, ',dx', dap.close, opts)

dap.set_log_level('TRACE')

dap.adapters.php = {
  type = 'executable',
  command = vim.g.initialVimDirectory .. '/bin/vscode-php-debug',
  args = { 'run' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for XDebug',
    port = 9003,
    stopOnEntry = false,
    xdebugSettings = {
      max_children = 512,
      max_data = 1024,
      max_depth = 4,
    },
    breakpoints = {
      exception = {
        Notice = false,
        Warning = false,
        Error = false,
        Exception = false,
        ['*'] = false,
      },
    },
  }
}
