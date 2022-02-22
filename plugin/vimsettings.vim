set number
set mouse=a
colorscheme darkblue

function! ClosePopupForTab() abort
  call nvim_tabpage_list_wins(0)
        \ ->filter({_,v -> 'popup' ==# win_gettype(v)})
        \ ->map({_,v -> nvim_win_close(v, v:true)})
endfunction

nnoremap <Esc> call ClosePopupForTab()<CR>
