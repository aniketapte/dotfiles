set ai
set cindent
set ts=4
set shiftwidth=4
set expandtab
set tw=80
set incsearch
set ruler
set laststatus=2
set hlsearch
set ignorecase
set nobackup
syn on
set background=dark

set cursorLine
hi CursorLine ctermbg=darkred ctermfg=white guibg=lightyellow

function! GuiTabLabel()
    let label = ''
    
    " modified since last save?
    let buflist = tabpagebuflist(v:lnum)
    for bufnr in buflist
        if getbufvar(bufnr, '&modified')
            let label .= '*'
            break
        endif
    endfor
    
    " append tab number
    let label .= v:lnum . ': '
    
    # filename without path info
    let n = bufname(buflist[tabpagewinnr(v:lnum)-1])
    let label .= fnamemodify(n, ':t')
    
    return label
endfunction

set guitablabel=%{GuiTabLabel()}

set nocp
filetype plugin on

" set guifont=Ubuntu\ Mono\ 9

" remove toolbar
set guioptions-=T

" Zenburn options, needs theme
let g:zenburn_high_Contrast = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_disable_Label_underline = 1

colo zenburn
