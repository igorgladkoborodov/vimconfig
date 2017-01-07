set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My bundles
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomtom/tcomment_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'drn/zoomwin-vim'
Plugin 'rking/ag.vim'
Plugin 'wincent/command-t'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'vim-scripts/LustyJuggler'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'digitaltoad/vim-pug'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jaywilliams/vim-vwilight'

" Gui Plugins
if has("gui_running")
  Plugin 'scrooloose/syntastic'
  " Plugin 'Valloric/YouCompleteMe'
endif

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


" NERD tree
map <Leader>a :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
set guioptions-=L
" autocmd VimEnter * NERDTree


" Solarized colors
"let g:solarized_termcolors=256    "default value is 16
let g:solarized_visibility="low"    "default value is normal
let g:solarized_contrast = "normal"
syntax enable
colorscheme solarized
set background=dark

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" CommandT
let g:CommandTMaxHeight=20
" refresh command-t on \r
map <Leader>r :CommandTFlush<CR>

" LustyJuggler
map <Leader>s :LustyJuggler<CR>




set number
set ruler
syntax enable

set laststatus=2

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
"set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter


" Wrap by default
set wrap

" Navigation on wrapped lines
nmap <silent> j gj
nmap <silent> k gk

" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Don't require to save buffer on switch
set hidden

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


" show current git branch on status line
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


" lusty explorer
"let g:LustyExplorerSuppressRubyWarning = ""
"nnoremap <silent> <D-u> :LustyBufferExplorer<CR>
"nnoremap <silent> <D-i> :LustyFilesystemExplorerFromHere<CR>

set scrolloff=5

" Invisible characters
set list
set listchars=eol:¬,tab:→\ ,nbsp:_,precedes:(,extends:),trail:·

" Set .as for Actionscript
autocmd BufNewFile,BufRead *.as set filetype=actionscript

