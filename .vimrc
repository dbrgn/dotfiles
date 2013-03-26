" Use Vim defaults instead of 100% vi compatibility 
set nocompatible

" Temporarily disable filetype plugin
filetype off

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Enable vundle to load plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()



" Let vundle manage vundle
Bundle 'gmarik/vundle'

" Command-T
Bundle 'Command-T'

" Supertab
Bundle 'ervandew/supertab'

" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'davidhalter/vim-snipmate'

" Python plugins
Bundle 'vim-flake8'
Bundle 'fs111/pydoc.vim'

" Support for less syntax highlighting
Bundle 'groenewege/vim-less'

" Autocompletion
Bundle 'davidhalter/jedi-vim'
Bundle 'rubycomplete.vim'

" Zen coding
Bundle 'mattn/zencoding-vim'

" C/C++ bundles
Bundle 'gtk-vim-syntax'

" Enhanced status line
Bundle 'Lokaltog/powerline'



" Re-enable filetype plugin
filetype indent plugin on

" Syntax-highlighting
set background=dark
syntax on

" Custom highlighting colors
hi Folded ctermbg=17
hi Folded ctermfg=159
hi CursorLine cterm=none ctermbg=236
hi ColorColumn cterm=none ctermbg=236

" Map leader key
let mapleader = ","

" Autocompletion configuration
set wildmode=longest:full
set wildmenu

" Tab key configuration (use 4 spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " Use spaces instead of tabs

" Extended % matching
runtime macros/matchit.vim

" Other settings
set ruler           " Show the line and column number in status line
set showcmd         " Show (partial) command in status line
set laststatus=2    " Always show status line
set showmode        " Display current editing mode
set title           " Make the window title reflect the file being edited
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set history=1000    " Set history to 1000 entries
set nu              " Line numbers
set nowrap          " No line breaks
set incsearch       " Enable incremental search
set hlsearch        " Highlight search results
set cursorline      " Highlight the current line
set backspace=2     " Allow backspacing over everything
set hidden          " Better support to put buffers in the background
set scrolloff=3     " Scroll 3 lines before reaching the current viewport end
set foldmethod=marker " Use markers for folding
set tabpagemax=50   " Max tabs for vim -p

" Tab shortcuts
map <C-n> :tabn<Enter>
map <C-p> :tabp<Enter>

" Switch split
map + <C-w>w
" Change split size
map <C-j> <C-w>-
map <C-k> <C-w>+
map <C-h> <C-w><
map <C-l> <C-w>>

" Toggle whitespace with ,s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" Toggle line numbers with ,n
nmap <silent> <leader>n :set nonu!<CR>

" Toggle paste mode with F3
set pastetoggle=<F3>

" Faster up/down movement
map <C-j> 5j
map <C-k> 5k

" Useful aliases
command! Q  q
command! W  w
command! Wq  wq
command! WQ  wq


""" Plugin settings

" Don't use pyflakes quickfix feature
let g:pyflakes_use_quickfix = 0

" Configure flake8
let g:flake8_ignore=""
let g:flake8_max_line_length="99"

" Configure tab completion
au FileType python set omnifunc=jedi#complete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex'. The following changes the default filetype back to 'tex'
let g:tex_flavor='latex'

" Compile latex and restart mupdf
map <leader>l :w<CR> :!rubber -m pdftex % && killall -HUP mupdf<CR><CR>

" Run make
map <leader>m :w<CR> :!make<CR><CR>

" Configure Command-T behavior
let g:CommandTAcceptSelectionTabMap='<CR>'
let g:CommandTAcceptSelectionSplitMap='<C-CR>'

" Configure snipmate
let g:snips_author='Danilo Bargen'
let g:snipMateAllowMatchingDot = 0

" Configure GTK syntax highlighting
let glib_deprecated_errors = 1

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
