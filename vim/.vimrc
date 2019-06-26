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
set ignorecase smartcase
set colorcolumn=120
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set number relativenumber

" enable remap of motions captured by the terminal
silent !stty -ixon > /dev/null 2>/dev/null

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'terryma/vim-multiple-cursors'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"coc (externally installed: coc-rls, coc-json, coc-python, coc-tsserver)
"---
autocmd FileType json syntax match Comment +\/\/.\+$+

" markdown preview
" ----------------
let g:mkdp_open_to_the_world=1
let g:mkdp_open_ip = '127.0.0.1'

" ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

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

" run goimports on save
let g:go_fmt_command = "goimports"

" keymaps
" -------
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-t> :vnew<CR>
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <C-q> :qa<CR>
nnoremap ee :CocList diagnostics<CR>
nnoremap <C-f> :Rg<SPACE>
noremap <silent> <C-p> :FZF<CR>
vnoremap <C-y> "*y
vnoremap <leader>" c""<ESC>P
inoremap jk <ESC>

" keywords
" --------
:command JSON %!jq '.'


" multi-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key           = 'g<C-x>'
let g:multi_cursor_next_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" import CoC customizations
runtime custom.vim 
