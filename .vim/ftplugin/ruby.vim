" Tab key configuration (use real double 2 spaces)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Override ruby-vim textwidth
set textwidth=80

" Highlight the 100th column
if exists('+colorcolumn')
    set colorcolumn=100
else
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    match OverLength /\%>80v.\+/
endif
