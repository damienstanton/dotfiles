""""""""""
" +----+ "
" | DS | "
" +----+ "
""""""""""

" General Editor Config
" ---------------------
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set copyindent
set relativenumber
set mouse=a
set backspace=indent,eol,start
set updatetime=300
set splitbelow
set ignorecase smartcase
set colorcolumn=100
set timeoutlen=1000 ttimeoutlen=0 " adjust for esc delay

" enable remap of motions captured by the terminal
silent !stty -ixon > /dev/null 2>/dev/null

call plug#begin('~/.vim/plugged')
" General Plugins
" ---------------
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-commentary'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'dense-analysis/ale'
Plug 'cormacrelf/vim-colors-github'
" Language plugins
" ----------------
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'udalov/kotlin-vim'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'leafgarland/typescript-vim'
call plug#end()

" Style 
" -----
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set notermguicolors 

" Gruvbox (dark)
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
hi Normal ctermbg=NONE

" GitHub (light)
" colorscheme github
" set background=light
" let g:airline_theme = "github"
" hi Normal ctermbg=NONE

let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" Language Server
" --------------
set hidden
let g:LanguageClient_serverCommands= {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
    \ }

" Syntax/Lint options
" -------------------
" JSON
" ----
autocmd FileType json syntax match Comment +\/\/.\+$+

" Go
" --
let g:go_fmt_command="gofmt"

" Rust
" ----
let g:LanguageClient_useVirtualText=0
let g:rustfmt_autosave=1
let g:tmuxline_powerline_separators=0

" ALE
" ---
let g:ale_sign_column_always=1
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ'
hi clear ALEErrorSign
hi clear ALEWarningSign
hi clear ALEInfoSign

" Keybindings
" -----------
let g:move_key_modifier='C'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='g<C-x>'
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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
tnoremap <F1> <C-W>N

" Keywords
" --------
:command JSON %!jq '.'

" Distraction free mode
runtime presentation.vim
