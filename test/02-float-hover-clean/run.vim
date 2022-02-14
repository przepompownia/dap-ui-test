function! RunJob(phpfile)
  let l:command = 'php -c .php.ini ' . a:phpfile
  echom 'Running job ' . l:command
  call jobstart(l:command, #{clear_env: v:true})
endfunction

let phpFile='./test/fixture/foo.php'
call bufadd(phpFile)

lua require'dap'.continue()
sleep 500m
call RunJob(phpFile)
sleep 500m

execute "normal 4Gz-vi)"
lua require'dapui'.eval()

sleep 500m
let winId = win_getid()
let winIds = nvim_tabpage_list_wins(0)
eval winIds->remove(winIds->index(winId))

call nvim_win_close(winIds[0], v:true)

execute "normal gv"
lua require'dapui'.eval()
