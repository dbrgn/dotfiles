" Highlight the 100th column
if exists('+colorcolumn')
    set colorcolumn=100
else
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    match OverLength /\%>80v.\+/
endif

" Tab key configuration (use 4 spaces softtab)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Set textwidth
set textwidth=80
