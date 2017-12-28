" Press a on opened NERDTree to pin it, don't close on file open
call NERDTreeAddKeyMap({
\ 'key': 'a',
\ 'callback': 'NERDTreeLockOnOpen',
\ 'quickhelpText': 'Lock NERDTree opened',
\ 'scope': 'all' })

function! NERDTreeLockOnOpen()
  let g:NERDTreeQuitOnOpen = g:NERDTreeQuitOnOpen == 0 ? 1 : 0
endfunction
