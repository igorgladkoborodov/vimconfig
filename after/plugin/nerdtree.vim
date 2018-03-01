" Press a on opened NERDTree to pin it, don't close on file open
call NERDTreeAddKeyMap({
\ 'key': 'a',
\ 'callback': 'NERDTreeLockOnOpen',
\ 'quickhelpText': 'Lock NERDTree opened',
\ 'scope': 'all' })

function! NERDTreeLockOnOpen()
  let g:NERDTreeQuitOnOpen = g:NERDTreeQuitOnOpen == 0 ? 1 : 0
endfunction

" Don't switch tabs when open file
call NERDTreeAddKeyMap({'key': g:NERDTreeMapActivateNode, 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
function NERDTreeMyOpenFile(node)
    call a:node.activate({'reuse': 'currenttab', 'where': 'p'})
endfunction
