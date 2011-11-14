" Enable pathogen to autoload all bundled plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Use Vim defaults instead of 100% vi compatibility 
set nocompatible

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Enable filetype plugin
filetype indent plugin on

" Syntax-highlighting
set background=dark
syntax on

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

" Put all temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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
set backspace=2     " Allow backspacing over everything
set hidden          " Better support to put buffers in the background
set scrolloff=3     " Scroll 3 lines before reaching the current viewport end

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
nmap <silent> <leader>s :set nolist!<CR>

" Useful aliases
command! Q  q
command! W  w
command! Wq  wq
command! WQ  wq



""" Plugin settings


" Don't use pyflakes quickfix feature
let g:pyflakes_use_quickfix = 0

" Use pep8 validation
let g:pep8_map='<leader>8'

" Configure tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Map rope commands
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
