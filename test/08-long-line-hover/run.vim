function! RunJob(phpfile)
  call jobstart(['php', '-n', '-c'. '.php.ini', a:phpfile], #{clear_env: v:true})
endfunction

let fixtureDir = expand('<sfile>:p:h')
let phpFile = fixtureDir .. '/ind.php'
exec 'edit ' .. fixtureDir .. '/ind.php'

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
" execute 'botright vsplit term://tail -f ' .. stdpath('cache') .. '/dap.log'
" botright split term://tail -f /tmp/xdebug.log
" sleep 500m
" lua require'dapui'.eval('$x', {enter = true, context = 'repl'})
