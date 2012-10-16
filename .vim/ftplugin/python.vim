" Highlight the 100th column
if exists('+colorcolumn')
    set colorcolumn=100
else
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    match OverLength /\%>80v.\+/
endif
