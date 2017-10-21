function ToggleFont()
  let w:font_variant = exists('w:font_variant') ? (w:font_variant + 1)%2 : 1
  if w:font_variant == 0
    set guifont=SF\ Mono\ Regular:h12
    set background=light
    let g:solarized_contrast="normal"
    colorscheme solarized
    hi SyntasticErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=none
    hi SyntasticWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  guibg=#eee8d5  gui=none
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  guibg=#eee8d5  gui=none
  elseif w:font_variant == 1
    set guifont=SF\ Mono\ Light:h12
    let g:solarized_contrast="high"
    set background=dark
    colorscheme solarized
    hi SyntasticErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  guibg=#073642  gui=none
    hi SyntasticWarningSign ctermfg=10  ctermbg=0  guifg=#fffb00  guibg=#073642  gui=none
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  guibg=#073642  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#fffb00  guibg=#073642  gui=none
  endif
endfunction

" Solarized colors
let g:enable_italic_font = 0
let g:enable_bold_font = 0

let g:solarized_termcolors=16    "default value is 16
let g:solarized_visibility="low"    "default value is normal
let g:solarized_termtrans=1

call ToggleFont()
if has("gui_running")
  call ToggleFont()
  map <F6> :call ToggleFont()<CR>
end

