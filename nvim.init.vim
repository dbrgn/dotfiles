""" BASE CONFIG

" Enable true color
set termguicolors

" Map leader key
let mapleader = ","

" Default tab configuration (use 4 spaces)
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Language specific tab configuration
if has("autocmd")
  " Tabs
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType asm setlocal ts=4 sts=4 sw=4 noexpandtab

  " Spaces
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
endif

" Other settings
set title           " Make the window title reflect the file being edited
set ignorecase      " Do case insensitive matching
set history=2000    " Set history to 2000 entries
set number          " Line numbers
set nowrap          " No line breaks
set cursorline      " Highlight the current line
set colorcolumn=99  " Highlight the current line
set nohidden        " Actually delete a buffer when closing a tab
set scrolloff=3     " Scroll 3 lines before reaching the current viewport end

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

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

" Useful aliases
command! Q  q
command! W  w
command! Wq  wq
command! WQ  wq

" Compile LaTeX and restart mupdf
map <leader>l :w<CR> :!rubber -m pdftex %<CR><CR>
map <leader>p :!zathura %:r.pdf &<CR><CR>

" Run make
map <leader>m :w<CR> :!make<CR><CR>


""" PLUGINS

" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Theme
Plug 'gosukiwi/vim-atom-dark'

" Ctrl-P
Plug 'kien/ctrlp.vim'

" Fugitive (git)
Plug 'tpope/vim-fugitive'

" Airline (Powerline alternative)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP / Autocompletion
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'

" Code formatting
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()


""" AUTOCOMPLETION / LSP

lua << EOF
require('nvim_lsp').rust_analyzer.setup({ on_attach=require('completion').on_attach })
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


""" PLUGIN SETTINGS

" Ctrl-P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ 'MarkToOpen()':         ['<c-z>'],
\ }
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

" Autoformat
noremap <leader>f :Autoformat<CR>


""" THEME

colorscheme atom-dark
