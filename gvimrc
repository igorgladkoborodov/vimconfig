" Font
" set guifont=InputMono\ Light:h11
" set guifont=Menlo:h11
" set linespace=1

function ToggleFont()
  let w:small_font = exists('w:small_font') ? !w:small_font : 0
  if w:small_font
    set guifont=Menlo:h11
    set linespace=0
  else
    set guifont=Menlo:h10
    set linespace=1
  endif
endfunction
call ToggleFont()
map <F6> :call ToggleFont()<CR>

"Solarized
set background=light
call togglebg#map("<F5>")


