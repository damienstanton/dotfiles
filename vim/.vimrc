" general configs
" --------------
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set mouse=a
set backspace=indent,eol,start
set updatetime=300
" set number
" uncomment for relative line numbers
set number relativenumber

" plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
call plug#end()

"coc
"---
autocmd FileType json syntax match Comment +\/\/.\+$+


" colors
" ------
set termguicolors
colorscheme gruvbox
set background=dark

" move lines
let g:move_key_modifier = 'C'

" LSP
" ---
set hidden
let g:LanguageClient_serverCommands= {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
    \ }

" disable vtext (RLS is especially onerous)
let g:LanguageClient_useVirtualText=0

" keymaps
nnoremap <silent> <c-b> :NERDTreeToggle<CR>
nnoremap <silent> <c-t> :tabnew<CR>
nnoremap <silent> <c-n> :tabnext<CR>
nnoremap <silent> <c-\> :vsplit<CR>
nnoremap <gg> :call LanguageClient_contextMenu()<CR>
map <silent> <c-p> :FZF<CR>
