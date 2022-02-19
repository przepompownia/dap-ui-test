function! RunJob(phpfile)
  call jobstart(['php', '-c'. '.php.ini', a:phpfile], #{clear_env: v:true})
endfunction

let fixtureDir = expand('<sfile>:p:h')
let phpFile = fixtureDir .. '/ind.php'
exec 'edit ' .. fixtureDir .. '/ind.php'

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m
lua require'dapui'.eval('$largeArray', {enter = true, context = 'repl'})

botright vsplit term://tail -f /tmp/xdebug.log
