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
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600  guibg=#073642  gui=NONE
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#FFCC01  guibg=#073642  gui=NONE
    hi CursorLine ctermfg=NONE ctermbg=236 guifg=NONE guibg=#073642 guisp=#93a1a1 cterm=NONE gui=NONE
    hi MatchParen ctermfg=230 ctermbg=160 guifg=#fdf6e3 guibg=#dc322f guisp=NONE cterm=NONE gui=NONE
    hi clear MatchTag
  elseif g:colors_variant == 1
    set background=light
    colorscheme solarized8
    call ToggleFontTo(2)
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=NONE
    hi ALEWarningSign ctermfg=10  ctermbg=0  guifg=#b58901  guibg=#eee8d5  gui=NONE
    hi CursorLine ctermfg=NONE ctermbg=254 guifg=NONE guibg=#eee8d5 guisp=#586e75 cterm=NONE gui=NONE
    hi MatchParen ctermfg=230 ctermbg=32 guifg=#fdf6e3 guibg=#268bd2 guisp=NONE cterm=NONE gui=NONE
    hi clear MatchTag
  endif

  " Make lightline switch light/dark background
  runtime autoload/lightline/colorscheme/solarized.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()

  call SpellOff()

  call RemoveBoldItalic()

  if exists('g:clear_end_of_buffer')
    hi! link EndOfBuffer NonText
  end
endfunction

function RemoveBoldItalic()
  hi Comment gui=NONE
  hi gitcommitComment gui=NONE
  hi htmlSpecialTagName gui=NONE
  hi pandocComment gui=NONE
  hi pandocEmphasisDefinition gui=NONE
  hi pandocEmphasisTable gui=NONE
  hi pandocEmphasis gui=NONE

  hi CursorLineNr gui=NONE
  hi Title cterm=NONE gui=NONE
  hi NonText cterm=NONE gui=NONE
  hi SpecialKey cterm=NONE gui=NONE
  hi DiffDelete cterm=NONE gui=NONE
  hi MatchParen cterm=NONE gui=NONE
  hi Question term=NONE gui=NONE
  hi WarningMsg cterm=NONE gui=NONE
  hi Error cterm=NONE gui=NONE
  hi Todo cterm=NONE gui=NONE
  hi ToolbarButton cterm=NONE gui=NONE
  hi htmlTagN cterm=NONE gui=NONE
  hi htmlTagName term=NONE gui=NONE
  hi rubyDefine cterm=NONE gui=NONE
  hi Folded cterm=NONE gui=NONE
  hi MatchParen term=NONE gui=NONE
  hi Question term=NONE gui=NONE
endfunction

function ToggleColorsTo(colors_variant)
  let g:colors_variant = a:colors_variant - 1
  call ToggleColors()
endfunction

function SpellOff()
  let g:spell_variant = -1
  call ToggleSpell()
endfunction

function ToggleSpell()
  let g:spell_variant = exists('g:spell_variant') ? (g:spell_variant + 1) % 2 : 0
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

if has("gui_running")
  call ToggleColorsTo(1)
  map <F5> :call ToggleFont()<CR>
  map <F6> :call ToggleColors()<CR>
  map <F7> :call ToggleSpell()<CR>
else
  call ToggleColorsTo(0)
endif

" Make ~ in the end less visible.
" It loads super slow if I just set hightlight for EndOfBuffer from the
" beginning.
function InitEndOfBufferClear()
  let g:clear_end_of_buffer = 1
  hi! link EndOfBuffer NonText
endfunction
autocmd BufReadPost * call InitEndOfBufferClear()
