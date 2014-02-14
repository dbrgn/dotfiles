" Use Vim defaults instead of 100% vi compatibility 
set nocompatible

" Fix issues with colors
set term=xterm-256color

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

" Ultisnips
Bundle 'SirVer/ultisnips'

" Autocompletion (YCM)
Bundle 'Valloric/YouCompleteMe'

" Autocompletion (Supertab/Jedi)
"Bundle 'ervandew/supertab'
"Bundle 'davidhalter/jedi-vim'

" Python plugins
Bundle 'vim-flake8'
Bundle 'fs111/pydoc.vim'

" Support for less syntax highlighting
Bundle 'groenewege/vim-less'

" Zen coding
Bundle 'mattn/emmet-vim'

" C/C++ bundles
Bundle 'gtk-vim-syntax'

" Golang bundle
Bundle 'Blackrush/vim-gocode'

" Enhanced status line
Bundle 'Lokaltog/powerline'

" Arduino syntax highlighting
Bundle "sudar/vim-arduino-syntax"

" Ansible YAML syntax highlighting fixes
Bundle 'chase/vim-ansible-yaml'


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

" Default tab configuration (use 4 spaces)
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Language specific tab configuration
if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
endif

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
set history=2000    " Set history to 2000 entries
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
set modeline        " Use modeline

" Tab shortcuts
map <C-n> :tabn<Enter>
map <C-p> :tabp<Enter>

" Save shortcut
map <leader>s :w<Enter>

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
let g:flake8_ignore = "E126,E127,E128"
let g:flake8_max_line_length = "99"

" Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex'. The following changes the default filetype back to 'tex'
let g:tex_flavor = 'latex'

" Compile latex and restart mupdf
map <leader>l :w<CR> :!rubber -m pdftex % && killall -HUP mupdf<CR><CR>

" Run make
map <leader>m :w<CR> :!make<CR><CR>

" Configure Command-T behavior
let g:CommandTAcceptSelectionTabMap = "<CR>"
let g:CommandTAcceptSelectionSplitMap = "<C-CR>"
noremap <F5> :CommandTFlush<CR>

" Configure YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Configure Supertab / Jedi
" au FileType python set omnifunc=jedi#complete
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview

" Configure UltiSnips
let g:UltiSnipsExpandTrigger = "<C-x>"
let g:UltiSnipsListSnippets = "<C-l>"

" Configure GTK syntax highlighting
let glib_deprecated_errors = 1

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
