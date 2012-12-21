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

" Custom bundles
Bundle 'vim-flake8'
Bundle 'Command-T'
Bundle 'fs111/pydoc.vim'
Bundle 'ervandew/supertab'
Bundle 'groenewege/vim-less'
Bundle 'jcf/vim-latex'
Bundle 'davidhalter/jedi-vim'
Bundle 'rubycomplete.vim'

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
set pastetoggle=<F3>
nmap <silent> <leader>s :set nolist!<CR>
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
set completeopt=menuone,preview

" Grep will sometimes skip displaying the file name if you search
" in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex'
let g:tex_flavor='latex'

" Compile latex and restart mupdf
map <leader>l :w<CR> :!rubber -m pdftex % && killall -HUP mupdf<CR><CR>

" Run make
map <leader>m :w<CR> :!make<CR><CR>

" Configure Command-T behavior
let g:CommandTAcceptSelectionTabMap='<CR>'
let g:CommandTAcceptSelectionSplitMap='<C-CR>'
