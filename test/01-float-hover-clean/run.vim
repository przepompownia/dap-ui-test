function! RunJob(phpfile)
  let l:command = 'php -dzend_extension=xdebug.so ' . a:phpfile
  echom 'Running job ' . l:command
  call jobstart(l:command)
endfunction

let phpFile='./test/fixture/foo.php'
call bufadd(phpFile)

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m

execute "normal 4Gz-vi)"
lua require'dapui'.eval()
