local dap = require 'dap'
local keymap = require 'vim.keymap'
local widgets = require('dap.ui.widgets')
local utils = require('dap.utils')

dap.set_log_level('TRACE')

dap.adapters.php = {
  type = 'executable',
  command = vim.g.initialVimDirectory .. '/bin/vscode-php-debug',
  args = { 'run' }
}

dap.configurations.php = {
  {
    log = true,
    type = 'php',
    request = 'launch',
    name = 'Listen for XDebug',
    port = 9005,
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

local api = vim.api
local debugWinId = nil

local function goToDebugWin()
  if nil ~= debugWinId and api.nvim_win_is_valid(debugWinId) then
    api.nvim_set_current_win(debugWinId)

    return true
  end
end

local function verboseGoToDebugWin()
  if goToDebugWin() then
    return
  end

  vim.notify('Debug window is not defined yet.')
end

local function closeDebugWin()
  if nil == debugWinId then
    return
  end
  local tabNr = api.nvim_tabpage_get_number(api.nvim_win_get_tabpage(debugWinId))
  vim.cmd('tabclose ' .. tabNr)
end

local function openTabForThread()
  if goToDebugWin() then
    return
  end

  vim.cmd([[
    tabedit %
    setlocal scrolloff=10
  ]])
  debugWinId = vim.fn.win_getid()
  require('dapui').open()
end

dap.listeners.before['event_stopped']['arctgx-dap-tab'] = function()
  openTabForThread()
end

local opts = {silent = true, noremap = true}
keymap.set({'n'}, ',dw', verboseGoToDebugWin, opts)
keymap.set({'n'}, ',dc', closeDebugWin, opts)
keymap.set({'x'}, ',dh', function() widgets.hover(utils.get_visual_selection_text) end, opts)
keymap.set({'n'}, ',dv', dap.step_over, opts)
keymap.set({'n'}, ',di', dap.step_into, opts)
keymap.set({'n'}, ',do', dap.step_out, opts)
keymap.set({'n'}, ',db', dap.toggle_breakpoint, opts)
keymap.set({'n'}, ',dr', dap.continue, opts)
keymap.set({'n'}, ',du', dap.up, opts)
keymap.set({'n'}, ',dd', dap.down, opts)
keymap.set({'n'}, ',dx', dap.close, opts)
