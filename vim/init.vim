" general configs
" --------------
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set mouse=a
" set number
" uncomment for relative line numbers
set number relativenumber
au TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

" plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'udalov/kotlin-vim'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" colors
" ------
set termguicolors
colorscheme codedark
set background=dark

" move lines
let g:move_key_modifier = 'C'

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" LSP
" ---
set hidden
let g:LanguageClient_serverCommands= {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['gopls'],
    \ }

" disable vtext (RLS is especially onerous)
let g:LanguageClient_useVirtualText=0
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
