function! RunJob(phpfile)
  let l:command = 'php -c .php.ini ' . a:phpfile
  echom 'Running job ' . l:command
  call jobstart(l:command, #{clear_env: v:true})
endfunction

let fixtureDir = expand('<sfile>:p:h')

let phpFile = fixtureDir .. '/ind.php'

exec 'edit ' .. fixtureDir .. '/bar.php'

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m

lua require'dapui'.toggle()
sleep 500m
lua require'dap'.up()
