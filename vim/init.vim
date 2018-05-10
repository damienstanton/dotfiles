" general configs
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
Plug 'jiangmiao/auto-pairs'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" plugin configs
" -----------
let g:deoplete#enable_at_startup = 1
let g:gitgutter_enabled = 1

" fuzzy finder
" ------------
set rtp+=/usr/local/opt/fzf

" colors
" ------
colorscheme nofrils-light
let g:airline_theme='papercolor'
hi Normal term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=#000000 guibg=NONE
