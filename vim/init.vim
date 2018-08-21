" general configs
" --------------
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent 
set mouse=a
set relativenumber

" plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'robertmeta/nofrils'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'matze/vim-move'
Plug 'idris-hackers/idris-vim'
Plug '/usr/local/opt/fzf'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
Plug 'dag/vim-fish'
call plug#end()

" plugin configs
" -----------
" autocomplete
let g:deoplete#enable_at_startup = 1

" gitgutter
let g:gitgutter_enabled = 1

" notes
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.txt'

" move lines
let g:move_key_modifier = 'C'

" colors
" ------
colorscheme solarized
set background=dark
let g:airline_theme='papercolor'
" hi Normal term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=#000000 guibg=NONE

" rls config
" ----------
set hidden
let g:LanguageClient_serverCommands = { 
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'go': ['~/go/bin/go-langserver']
            \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
