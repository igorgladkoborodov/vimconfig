" Font
set guifont=SF\ Mono\ Regular:h12

function ToggleFont()
  let w:font_variant = exists('w:font_variant') ? (w:font_variant + 1) %3 : 0
  if w:font_variant == 0
    colorscheme OceanicNext
  elseif w:font_variant == 1
    let g:solarized_contrast="high"
    set background=dark
    colorscheme solarized
  elseif w:font_variant == 2
    let g:solarized_contrast="normal"
    set background=light
    colorscheme solarized
  endif
endfunction
call ToggleFont()
map <F6> :call ToggleFont()<CR>



" Solarized colors
"let g:solarized_termcolors=256    "default value is 16
" let g:solarized_visibility="low"    "default value is normal
" let g:solarized_contrast = "normal"
" syntax enable
" colorscheme solarized
" set background=dark


"Solarized
"set background=light
"call togglebg#map("<F5>")


