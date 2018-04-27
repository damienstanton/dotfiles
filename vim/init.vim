" general config
" --------------
set termguicolors
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent 
set mouse=a

" plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'robertmeta/nofrils'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()

" autcomplete
" -----------
let g:deoplete#enable_at_startup = 1

" colors
" ------
colorscheme nofrils-light
let g:airline_theme='papercolor'
hi Normal ctermbg=none
