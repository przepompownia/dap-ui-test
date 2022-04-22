set updatetime=300
set number
set mouse=a
colorscheme darkblue
set signcolumn=auto:1-9

function! ClosePopupForTab() abort
  call nvim_tabpage_list_wins(0)
        \ ->filter({_,v -> 'popup' ==# win_gettype(v)})
        \ ->map({_,v -> nvim_win_close(v, v:true)})
endfunction

nnoremap <Esc> call ClosePopupForTab()<CR>
