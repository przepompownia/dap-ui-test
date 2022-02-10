scriptencoding utf-8

let g:initialVimDirectory = expand('<sfile>:p:h')
let &runtimepath = g:initialVimDirectory.','.&runtimepath.','.g:initialVimDirectory.'/after'
let &packpath = &runtimepath

if has('nvim')
  packadd! nvim-dap
  packadd! nvim-dap-ui
endif

let s:vimrc_per_host = g:initialVimDirectory . '/' . 'vimrc_per_host.vim'
if filereadable(expand(s:vimrc_per_host))
  execute 'source ' . expand(s:vimrc_per_host)
endif

set secure
set exrc
