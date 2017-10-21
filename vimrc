set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " Plugins manager
  Plugin 'VundleVim/Vundle.vim'

  " Show tree on Leader a
  Plugin 'scrooloose/nerdtree'

  " gc for comment
  Plugin 'tomtom/tcomment_vim'

  " Leader ig to show indent
  Plugin 'nathanaelkane/vim-indent-guides'

  " Double leader to zoom
  " Plugin 'drn/zoomwin-vim'

  " Leader f for search
  Plugin 'mileszs/ack.vim'

  " Find files on leader t
  " https://github.com/wincent/command-t/blob/master/doc/command-t.txt
  Plugin 'wincent/command-t'

  " Buffer navigation
  Plugin 'sjbach/lusty'

  " Fix copypaste
  Plugin 'ConradIrwin/vim-bracketed-paste'

  " File utils (:Rename, :Move, :Delete etc)
  Plugin 'tpope/vim-eunuch'

  " Git diff after save
  Plugin 'airblade/vim-gitgutter'

  " Autocomplete on tab
  " Plugin 'ervandew/supertab'

  " Autocomplete
  " https://github.com/Valloric/YouCompleteMe/#mac-os-x
  Plugin 'Valloric/YouCompleteMe'

  " Javascript & JSX syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'

  " Coffescript syntax
  Plugin 'kchmck/vim-coffee-script'

  " Ruby
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'

  " Color Scheme
  Plugin 'altercation/vim-colors-solarized'
  " Plugin 'kristijanhusak/vim-hybrid-material'
  " Plugin 'nightsense/vim-crunchbang'

  " Pretty status line
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Check syntacs
   " Plugin 'vim-syntastic/syntastic'
  Plugin 'w0rp/ale'

  " Working with pair symbols
  Plugin 'tpope/vim-surround'

  " Make . (repeat) operator useful for plugins
  Plugin 'tpope/vim-repeat.git'

  " Show marks
  Plugin 'kshenoy/vim-signature'

  " Graphical undo tree
  Plugin 'sjl/gundo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" ====================== PLUGINS SETTINGS =================
" ===============

" ============
" Airline
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'z', 'error', 'warning' ] ]
let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#tabline#enabled = 1                 " Enable tabline
let g:airline#extensions#tabline#show_tab_nr = 1             " Show tab number in tabs mode
let g:airline#extensions#tabline#tab_nr_type = 1             " Only show tab number
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0            " Don't show buffers with single tab

let g:airline#extensions#whitespace#enabled = 0              " Disable whitespace errors

" Show compact mode indicators
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline_section_z = '%3p%% %3l/%L:%3v'             " Compact line numbers
let g:airline_theme='base16'

" ===============
" NERD tree
map <Leader>a :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
set guioptions-=L
" autocmd VimEnter * NERDTree


" ===============
" ZoomWin
" map <Leader><Leader> :ZoomWin<CR>

" ===============
"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_error_symbol = "✗✗"
" let syntastic_style_error_symbol = "✗✗"
" let g:syntastic_warning_symbol = "!!"
" let syntastic_style_warning_symbol = "!!"
"
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
"

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop', 'mri'],
\}

let g:ale_sign_error = "✗✗"
let g:ale_sign_warning = "!!"

let g:ale_lint_on_text_changed = "never" " only lint on file save

" ===============
" CommandT
let g:CommandTMaxHeight=20

" refresh command-t on \r
map <Leader>r :CommandTFlush<CR>
set wildignore+=*/tmp,*/node_modules

" =============
" CtrlP
" map <Leader>r :CtrlPClearCache<CR>
" map <Leader>t :CtrlP<CR>
" let g:ctrlp_max_files=0
" let g:ctrlp_switch_buffer = 'et' " Open file in current pane instead of already opened one
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" set wildignore+=*/tmp,*/node_modules


" Hide status line for CtrlP
" let g:ctrlp_buffer_func = {
"   \ 'enter': 'Function_Name_1',
"   \ 'exit':  'Function_Name_2',
"   \ }
"
" func! Function_Name_1()
"   set laststatus=0
" endfunc
"
" func! Function_Name_2()
"   set laststatus=2
" endfunc

" ==================
" XkbSwitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

" ===============
" LustyJuggler
map <Leader>s :LustyJuggler<CR>

" ===============
" The Silver Searcher
" https://github.com/mileszs/ack.vim
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>f :Ack!<Space>


" =============
" JSX
let g:jsx_ext_required = 0    " Allow JSX in normal JS files

" =====================
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>


" ================= GENERAL SETTINGS ===================
language en_US                " sets the language of the messages / ui (vim)
" set ruler                   " Info in the bottom right
syntax enable

set laststatus=2

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.

" Whitespace
"set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set wrap                        " Wrap by default

" Folding
set foldenable                  " enable folding " space open/closes folds
set foldlevelstart=99
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Navigation on wrapped lines
nmap <silent> j gj
nmap <silent> k gk

set hidden                      " Don't require to save buffer on switch

" History size
set history=5000

" Directories for swp files
" set backupdir=~/.vim/backup//
" set directory=~/.vim/backup//
set nobackup
set noswapfile

" Ctrl + hjkl to navigate between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ============================
" Navigating tabs

" Leader Leader opens file in new tab
map <Leader><Leader> :tabe %<CR> 

" Go to tab n on <Leader>n
map <leader>1 1gt                       
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 8gt

map <D-S-]> gt
map <D-S-[> gT

" Shit+Alt+] to move tab left
" Shit+Alt+[ to move tab right
map ” :tabm -1<CR>
map ’ :tabm +1<CR>
" map <leader>[ :tabm -1<CR>              " Move tab left
" map <leader>] :tabm +1<CR>              " Move tab right


" =======================
" lusty explorer
"let g:LustyExplorerSuppressRubyWarning = ""
"nnoremap <silent> <D-u> :LustyBufferExplorer<CR>
"nnoremap <silent> <D-i> :LustyFilesystemExplorerFromHere<CR>

set scrolloff=5

" ======================
" Invisible characters
set list
set listchars=eol:¬,tab:→\ ,nbsp:_,precedes:(,extends:),trail:·

" Set .as for Actionscript
autocmd BufNewFile,BufRead *.as set filetype=actionscript

set number

" ===================
" Intent
" pressing < or > will let you iunident selected lines
vnoremap < <gv
vnoremap > >gv

" Turn on vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
