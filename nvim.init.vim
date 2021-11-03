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
Plug 'ctrlpvim/ctrlp.vim'

" Fugitive (git)
Plug 'tpope/vim-fugitive'

" Airline (Powerline alternative)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Completion framework
Plug 'hrsh7th/cmp-nvim-lsp' " LSP completion source
Plug 'hrsh7th/cmp-path'     " File system completion source
Plug 'hrsh7th/cmp-buffer'   " Buffer words completion source
Plug 'hrsh7th/cmp-cmdline'  " Vim cmdline completion

" TODO: Ultisnips
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" TODO: To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Code formatting
Plug 'Chiel92/vim-autoformat'

" Language support
Plug 'elmcast/elm-vim'
Plug 'cespare/vim-toml'
Plug 'udalov/kotlin-vim'

" Test running
Plug 'vim-test/vim-test'

" Initialize plugin system
call plug#end()


""" AUTOCOMPLETION / LSP

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Set up LSP
lua << EOF

    -- Configure Rust LSP through rust-tools.nvim plugin.
    -- rust-tools will configure and enable certain LSP features for us.
    -- See https://github.com/simrat39/rust-tools.nvim#configuration
    require('rust-tools').setup({
        -- Options from rust-tools
        tools = {
            autoSetHints = true,
            hover_with_actions = true,
            inlay_hints = {
                show_parameter_hints = false,
                parameter_hints_prefix = "",
                other_hints_prefix = "",
            },
        },

        -- All the opts to send to nvim-lspconfig
        -- These override the defaults set by rust-tools.nvim.
        -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
            -- on_attach is a callback called when the language server attachs to the buffer
            -- on_attach = on_attach,
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy on save
                    checkOnSave = {
                        command = "clippy"
                    },
                }
            }
        },
    })

    -- Python autocompletion with pylsp
    require('lspconfig').pylsp.setup({
        settings = {
            pyls = {
                configurationSources = { "pycodestyle" },
                plugins = {
                    pycodestyle = {
                        ignore = { "E124", "E126", "E127", "E128" },
                        maxLineLength = 99,
                    },
                },
            },
        },
    })

    -- Elm autocompletion with elmls
    require('lspconfig').elmls.setup{}

    -- Kotlin autocompletion with kotlin_language_server
    require('lspconfig').kotlin_language_server.setup{}

EOF

" Set up completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF

    local cmp = require'cmp'

    cmp.setup({
      -- Enable LSP snippets
      snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
      },

      -- Installed sources
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'cmdline' },
      },
    })

EOF

" Code navigation shortcuts
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <c-a> <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Avoid visual jitter when diagnostics appear by always showing the sign column
set signcolumn=yes

" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""" LANGUAGE SPECIFIC SETTINGS

autocmd Filetype rust setlocal textwidth=79
autocmd Filetype html setlocal textwidth=99
autocmd Filetype php setlocal textwidth=99

" Compilation commands
autocmd Filetype rust noremap <leader>b :!cargo build<CR>
autocmd Filetype rust noremap <leader>c :!cargo check<CR>


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

" Tests
let test#strategy = "neovim"
"let test#rust#cargotest#test_patterns = {
"    \ 'test': ['\v(#\[tokio::test\])'],
"    \ 'namespace': ['\vmod (tests?)']
"\}
"let test#rust#cargotest#patterns = {
"    \ 'test': ['\v\s*async fn\s+(\w+)'],
"    \ 'namespace': []
"\}

nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>


""" THEME

colorscheme atom-dark
