let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set colorcolumn=
        set norelativenumber
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set colorcolumn=100
        set relativenumber
    endif
endfunction

nnoremap <silent> <S-h> :call ToggleHiddenAll()<CR>
