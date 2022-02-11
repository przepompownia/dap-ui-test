function! RunJob(phpfile)
  let l:command = 'php -dzend_extension=xdebug.so ' . a:phpfile
  echom 'Running job ' . l:command
  call jobstart(l:command, #{
        \ env: #{
          \ XDEBUG_TRIGGER: "idekey=test",
          \ XDEBUG_CONFIG: "log=/tmp/xdebug-test.log",
          \ }
        \ })
endfunction

let phpFile='./test/fixture/foo.php'
call bufadd(phpFile)

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m

execute "normal 3Gz-vt\<Space>"
lua require'dapui'.eval()
