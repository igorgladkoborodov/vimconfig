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
  Plugin 'drn/zoomwin-vim'
  " regedarek/ZoomWin

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
  Plugin 'lifepillar/vim-solarized8'

  " Pretty status line
  Plugin 'itchyny/lightline.vim'

  " Check syntacs
  Plugin 'w0rp/ale'

  " Working with pair symbols
  Plugin 'tpope/vim-surround'

  " Make . (repeat) operator useful for plugins
  Plugin 'tpope/vim-repeat.git'

  " Show marks
  Plugin 'kshenoy/vim-signature'

  " Graphical undo tree
  Plugin 'sjl/gundo.vim'

  " Toggle loclist and quickfix by \l and \q
  Plugin 'Valloric/ListToggle'

  " Autoclose ( [ { ' ` "
  Plugin 'jiangmiao/auto-pairs'

  " Autoclose html tags
  Plugin 'alvan/vim-closetag'

  " Show matching tags
  Plugin 'Valloric/MatchTagAlways'

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
"
" ===============
" YouCompleteMe
set completeopt-=preview
let g:ycm_complete_in_comments = 1
" let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_collect_identifiers_from_tags_files = 1


" ===============
" Lightline

set background=light
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], ['relativepath'] ],
\   'right': [ [ 'lineinfo' ], ['readonly', 'linter_warnings', 'linter_errors'] ]
\ },
\ 'inactive': {
\   'left': [ ['relativepath'] ],
\   'right': [ ]
\ },
\ 'tabline': {
\   'left': [ [ 'tabs' ] ],
\   'right': [ [ 'pwd', 'close' ] ]
\ },
\ 'component': {
\   'lineinfo': '%2l/%L %2v',
\   'relativepath': '%f%{&modified?" 💾":""}',
\   'pwd': systemlist('dirs')[0]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'error',
\   'linter_errors': 'error'
\ },
\ 'mode_map': {
\   'n' : '',
\   'i' : '',
\   'R' : 'REPLACE',
\   'v' : '',
\   'V' : '',
\   "\<C-v>": '',
\   'c' : 'COMMAND',
\   's' : 'SELECT',
\   'S' : 'S-LINE',
\   "\<C-s>": 'S-BLOCK',
\   't': 'TERMINAL',
\ }
\ }

function! LightlineLinterWarnings() abort
  let l:problems = ale#engine#GetLoclist(bufnr(''))
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('W%d:L%d', all_non_errors, problems[0].lnum)
endfunction

function! LightlineLinterErrors() abort
  let l:problems = ale#engine#GetLoclist(bufnr(''))
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('E%d:L%d', all_errors, problems[0].lnum)
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ===============
" NERD tree
map <Leader>a :NERDTreeToggle<CR>
map <Leader>z :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
" let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=0
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = '▼'

" autocmd VimEnter * NERDTree

" How can I close vim if the only window left open is a NERDTree? 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remove right scrollbar
set guioptions-=L


" ===============
" ZoomWin
map <Leader><Leader> :ZoomWin<CR>


" ===============
" ALE

let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'ruby': ['rubocop', 'mri'],
\}

let g:ale_sign_error = "🚫"
let g:ale_sign_warning = "!!"

let g:ale_lint_on_text_changed = "never" " only lint on file save

" let g:airline#extensions#ale#enabled = 1

" ===============
" CommandT
let g:CommandTMaxHeight=20
let g:CommandTAlwaysShowDotFiles=1 " show hidden files

" refresh command-t on \r
map <Leader>r :CommandTFlush<CR>

" Leader b for buffers list
" nnoremap <silent> <leader>b :CommandTMRU<CR>
set wildignore+=*/tmp,*/node_modules,.DS_Store,*/.bundle

" Disable 'smart goto' https://github.com/wincent/command-t/blob/master/doc/command-t.txt#L617
let g:CommandTAcceptSelectionTabCommand = 'tabe'
let g:CommandTAcceptSelectionSplitCommand = 'sp'
let g:CommandTAcceptSelectionVSplitCommand = 'vs'
let g:CommandTAcceptSelectionCommand = 'e'

" enable esc for command-t in terminal
" https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
end


" ===============
" LustyJuggler
map <Leader>s :LustyJuggler<CR>
map <Leader>b :LustyBufferExplorer<CR>
map <Leader>e :LustyFilesystemExplorerFromHere<CR>


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
nnoremap `u :GundoToggle<CR>
nnoremap <Leader>u :GundoToggle<CR>


" ===========
" Closetag
" Use closetag on all filenames
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.erb,*.html.erb'

" ============================
" MatchTagAlways
" :set ft? to get filetype
let g:mta_filetypes = {
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'javascript.js' : 1,
\ 'javascript.jsx' : 1,
\ 'eruby' : 1
\ }

" Don't hightlight it
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0

" ====================
" Auto pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'


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
" enable folding " space open/closes folds
" set foldenable
" set foldlevelstart=99
" set foldnestmax=10
" nnoremap <space> za
" set foldmethod=indent

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

" Leader ] opens file in new tab
map <Leader>] :tabe %<CR>
map `] :tabe %<CR>
" map <Leader>+ :tabnew<CR>

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


set scrolloff=5

" ======================
" Invisible characters
set list
set listchars=eol:¬,tab:→\ ,nbsp:_,precedes:(,extends:),trail:·

" Set .as for Actionscript
autocmd BufNewFile,BufRead *.as set filetype=actionscript

set number

" ===================
" Indent
" pressing < or > will let you iunident selected lines
vnoremap < <gv
vnoremap > >gv

" =========
" Show cursor line
map <Leader>c :set cursorline!<CR>:set cursorcolumn!<CR>

" ===========
" Copy current filename to clipboard by `i
map `i :let @*=expand("%")<CR>
map <Leader>i :let @*=expand("%")<CR>

" Turn on vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Remove scrollbars in mvim
set guioptions=

" Limit syntax for long lines to increase speed
set synmaxcol=300

" Enable mouse in terminal
" set mouse=a

" Trying to make vim faster
" https://vi.stackexchange.com/questions/10495/most-annoying-slow-down-of-a-plain-text-editor
set regexpengine=1
set ttyfast
set lazyredraw

" Disable {visual}u lowercase. Always hit it by accident.
vmap u <Nop>

" Now load specifics to this host
if filereadable(expand("~/.vimlocal"))
  source ~/.vimlocal
endif

" Make gf work for node custom root
set path+=$PWD/**3

" P in visual mode paste last yanked register
vmap P "0p
" `y moves last saved register to register 0 to use it with P on visual mode
map `y :let @0=@"<CR>

" Open vim in max width
if has("gui_running")
  set lines=999 columns=9999
  " set fu
end

source $VIMRUNTIME/macros/matchit.vim
