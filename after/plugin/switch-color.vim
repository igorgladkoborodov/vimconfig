function ToggleFont()
  let g:font_variant = exists('g:font_variant') ? (g:font_variant + 1)%4 : 0

  if g:font_variant == 0
    set guifont=Monaco:h12
    set linespace=-1
  elseif g:font_variant == 1
    set guifont=Menlo:h11
    set linespace=1
  elseif g:font_variant == 2
    set guifont=SF\ Mono\ Regular:h12
    set linespace=1
  elseif g:font_variant == 3
    set guifont=SF\ Mono\ Light:h12
    set linespace=1
  endif
endfunction

function ToggleFontTo(font_variant)
  let g:font_variant = a:font_variant - 1
  call ToggleFont()
endfunction

function ToggleColors()
  let g:colors_variant = exists('g:colors_variant') ? (g:colors_variant + 1)%2 : 0
  if g:colors_variant == 0
    set background=dark
    colorscheme solarized8
    call ToggleFontTo(3)
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#FFCC01  gui=none
    hi CursorLine ctermfg=NONE ctermbg=236 guifg=NONE guibg=#073642 guisp=#93a1a1 cterm=NONE gui=NONE
  elseif g:colors_variant == 1
    set background=light
    colorscheme solarized8
    call ToggleFontTo(2)
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  gui=none
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  gui=none
    hi CursorLine ctermfg=NONE ctermbg=254 guifg=NONE guibg=#eee8d5 guisp=#586e75 cterm=NONE gui=NONE
  endif

  " Make lightline switch light/dark background
  runtime autoload/lightline/colorscheme/solarized.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()

  call SpellOff()
endfunction

function SpellOff()
  let g:spell_variant = 1
  call ToggleSpell()
endfunction

function ToggleSpell()
  let g:spell_variant = exists('g:spell_variant') ? (g:spell_variant + 1)%2 : 0
  if g:spell_variant == 0
    hi clear SpellBad
    hi clear SpellCap
    hi clear SpellLocal
    hi clear SpellRare
  elseif g:spell_variant == 1
    hi SpellBad cterm=underline gui=undercurl
    hi SpellCap cterm=underline gui=undercurl
    hi SpellLocal cterm=underline gui=undercurl
    hi SpellRare cterm=underline gui=undercurl
  endif
endfunction


" Solarized colors
let g:enable_italic_font = 0
let g:enable_bold_font = 0
let g:solarized_italic=0
let g:solarized_bold=0
" let g:solarized_termcolors=16    "default value is 16
let g:solarized_visibility="low"    "default value is normal
let g:solarized_contrast="normal"
let g:solarized_termtrans=1
" let g:solarized_old_cursor_style=0
" let g:solarized_statusline="low"

call ToggleColors()

if has("gui_running")
  call ToggleColors()
  map <F5> :call ToggleFont()<CR>
  map <F6> :call ToggleColors()<CR>
  map <F7> :call ToggleSpell()<CR>
end
