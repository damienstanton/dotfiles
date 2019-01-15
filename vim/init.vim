" general configs
" --------------
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent 
set mouse=a
set number
" uncomment for relative line numbers
" set number relativenumber

" plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
Plug 'dag/vim-fish'
Plug 'lifepillar/vim-solarized8'
Plug 'elubow/cql-vim'
Plug 'rhysd/vim-crystal'
Plug 'derekwyatt/vim-scala'
Plug 'davidhalter/jedi-vim'
Plug 'udalov/kotlin-vim'
Plug 'tomasiser/vim-code-dark'
" autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-jedi'
call plug#end()

" plugin configs
" -----------

" autocomplete
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


" gitgutter
let g:gitgutter_enabled = 1

" notes
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.txt'

" move lines
let g:move_key_modifier = 'C'

" colors
" ------
set termguicolors
colorscheme codedark
set background=dark
let g:airline_theme='ubaryd'

" rls config
" ----------
set hidden
let g:LanguageClient_serverCommands = { 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'] }
