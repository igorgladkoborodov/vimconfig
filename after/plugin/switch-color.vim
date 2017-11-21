function ToggleColors()
  let w:colors_variant = exists('w:colors_variant') ? (w:colors_variant + 1)%2 : 0
  if w:colors_variant == 0
    set background=dark
    colorscheme solarized
    hi SyntasticErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  guibg=#073642  gui=none
    hi SyntasticWarningSign ctermfg=10  ctermbg=0  guifg=#fffb00  guibg=#073642  gui=none
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  guibg=#073642  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#fffb00  guibg=#073642  gui=none
  elseif w:colors_variant == 1
    set background=light
    colorscheme solarized
    hi SyntasticErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=none
    hi SyntasticWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  guibg=#eee8d5  gui=none
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  guibg=#eee8d5  gui=none
  endif
endfunction

function ToggleFont()
  let w:font_variant = exists('w:font_variant') ? (w:font_variant + 1)%2 : 0
  if w:font_variant == 0
    set guifont=Monaco:h12
    set linespace=-1
  elseif w:font_variant == 1
    set guifont=Menlo:h12
    set linespace=1
  endif
endfunction

" Solarized colors
" let g:enable_italic_font = 0
" let g:enable_bold_font = 0
let g:solarized_termcolors=16    "default value is 16
let g:solarized_visibility="low"    "default value is normal
let g:solarized_contrast="normal"
let g:solarized_termtrans=1

call ToggleColors()

if has("gui_running")
  call ToggleFont()
  call ToggleColors()
  map <F5> :call ToggleFont()<CR>
  map <F6> :call ToggleColors()<CR>
end

