""""""""""
" +----+ "
" | DS | "
" +----+ "
""""""""""

" general configs
" ---------------
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set mouse=a
set backspace=indent,eol,start
set updatetime=300
set number relativenumber
set splitbelow

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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"coc
"---
autocmd FileType json syntax match Comment +\/\/.\+$+

" markdown preview
" ----------------
let g:mkdp_open_to_the_world=1
let g:mkdp_open_ip = '127.0.0.1'


" colors
" ------
set notermguicolors 
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

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
" -------
nnoremap <silent> <c-b> :NERDTreeToggle<CR>
nnoremap <silent> <c-t> :vnew<CR>
nnoremap <silent> <c-n> :tabnext<CR>
map <silent> <c-p> :FZF<CR>
vmap <c-y> "*y

" multi-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key           = 'g<C-x>'
let g:multi_cursor_next_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" import CoC customizations
runtime custom.vim 
