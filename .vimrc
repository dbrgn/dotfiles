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

" Editorconfig
Bundle 'editorconfig/editorconfig-vim'

" Ctrl-P
Bundle 'kien/ctrlp.vim'

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

" Zen coding
Bundle 'mattn/emmet-vim'

" Enhanced status line
Bundle 'Lokaltog/powerline'

" Searching
Bundle 'mileszs/ack.vim'

" Intensly orgasmic commenting (according to author)
Bundle 'scrooloose/nerdcommenter'

" Syntastic
Bundle 'scrooloose/syntastic'

" Surround
Bundle 'tpope/vim-surround'

" Dependencies for tsuquyomi
Bundle 'Shougo/vimproc.vim'

" Language support
Bundle 'gtk-vim-syntax'
Bundle 'Blackrush/vim-gocode'
Bundle 'groenewege/vim-less'
Bundle "sudar/vim-arduino-syntax"
Bundle 'chase/vim-ansible-yaml'
Bundle 'tpope/vim-markdown'
Bundle 'petRUShka/vim-opencl'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leafgarland/typescript-vim'
Bundle 'Quramy/tsuquyomi'
Bundle 'openscad.vim'

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

" File extension to filetype matching
if has("autocmd")
    autocmd BufNewFile,BufRead,TabEnter *.gs set filetype=javascript
endif

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
  autocmd FileType asm setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
endif

" Strip trailing whitespace automatically
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
if has("autocmd")
  autocmd BufWritePre *.py,*.js,*.html,*.css :call <SID>StripTrailingWhitespaces()
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
set nohidden        " Actually delete a buffer when closing a tab
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
map <C-h> <C-w><
map <C-l> <C-w>>

" Jump to prev/next quickfix with F6/F8
nmap <F6> :cp<CR>
imap <F6> <ESC>:cp<CR>
nmap <F8> :cn<CR>
imap <F8> <ESC>:cn<CR>

" Toggle whitespace with <leader>w
set listchars=tab:▸\ ,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" Toggle line numbers with ,n
nmap <silent> <leader>n :set nonu!<CR>

" Toggle paste mode with F3
set pastetoggle=<F3>

" Faster up/down movement
map <C-j> 10j
map <C-k> 10k

" Remap ESC
imap jk <ESC>

" Useful aliases
command! Q  q
command! W  w
command! Wq  wq
command! WQ  wq

" LaTeX mappings

if has("autocmd")
  autocmd FileType tex nmap <leader>b lbi\textbf{<ESC>ea}<ESC>
  autocmd FileType tex nmap <leader>i lbi\textit{<ESC>ea}<ESC>
endif

" Ack search
map <leader>a :Ack 


""" External function mappings

" Compile latex and restart mupdf
map <leader>l :w<CR> :!rubber -m pdftex % && killall -HUP mupdf<CR><CR>
map <leader>p :!mupdf %:r.pdf &<CR><CR>

" Run make
map <leader>m :w<CR> :!make<CR><CR>


""" Plugin settings

" Don't use pyflakes quickfix feature
let g:pyflakes_use_quickfix = 0

" Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex'. The following changes the default filetype back to 'tex'
let g:tex_flavor = 'latex'

" Configure CtrlP behavior
let g:ctrlp_map = '<leader>t'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ 'MarkToOpen()':         ['<c-z>'],
\ }

" Configure YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/usr/bin/python2'
let g:ycm_rust_src_path = '/home/danilo/rust'
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Configure Supertab / Jedi
" au FileType python set omnifunc=jedi#complete
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview

" Configure UltiSnips
let g:UltiSnipsExpandTrigger = "<C-x>"
let g:UltiSnipsListSnippets = "<C-l>"

" Configure GTK syntax highlighting
let glib_deprecated_errors = 1

" Typescript
let g:typescript_compiler_options = '-sourcemap --target ES2015'

" Configure Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_typescript_tsc_args = '-sourcemap --target ES2015'

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Flake8
let g:flake8_max_complexity=10

" Syntastic
let g:syntastic_python_checkers = ["python", "flake8", "pep257"]

" Surround
let g:surround_98 = "{% blocktrans trimmed %}\r{% endblocktrans %}"
let g:surround_116 = "{% trans \"\r\" %}"
