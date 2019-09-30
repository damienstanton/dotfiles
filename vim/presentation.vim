let s:hidden_all=0
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all=1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set colorcolumn=
        set norelativenumber
    else
        let s:hidden_all=0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set colorcolumn=100
        set relativenumber
    endif
endfunction

function! ToggleGutter()
    if !exists("b:gutter_on") || b:gutter_on
        set signcolumn=no
        let b:gutter_on=0
    else
        set signcolumn=yes
        let b:gutter_on=1
    endif
endfunction

nnoremap <silent> <S-h> :call ToggleHiddenAll()<CR>
nnoremap <silent> <S-g> :call ToggleGutter()<CR>
