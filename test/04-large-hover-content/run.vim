function! RunJob(phpfile)
  let l:command = 'php -c .php.ini ' . a:phpfile
  call jobstart(l:command, #{clear_env: v:true})
endfunction

let fixtureDir = expand('<sfile>:p:h')

let phpFile = fixtureDir .. '/ind.php'

exec 'edit ' .. fixtureDir .. '/ind.php'

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m

lua require'dapui'.toggle()
sleep 500m
lua require'dap'.up()
