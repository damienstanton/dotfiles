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
set noexpandtab
set autoindent
" set number
set mouse=a
set backspace=indent,eol,start
set updatetime=300
set splitbelow
set ignorecase smartcase
set colorcolumn=100
set timeoutlen=1000 ttimeoutlen=0 " adjust for esc delay
set splitright

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
Plug 'ncm2/float-preview.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language plugins
" ----------------
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'

call plug#end()

" Style 
" -----
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set notermguicolors 

" Gruvbox (dark)
colorscheme codedark
set background=dark
hi Normal ctermbg=NONE

" GitHub (light)
" colorscheme github
" set background=light
" let g:airline_theme = "github"
" hi Normal ctermbg=NONE

if exists("$TMUX")
	autocmd VimEnter * Tmuxline vim_statusline_2
endif

let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:tmuxline_powerline_separators=0

" ALE & LCS
" ---------
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rust-analyzer'],
\ }
let g:ale_linters = { 
    \ 'rust': ['rust-analyzer'],
    \ 'python': ['pyls', 'pyflakes'],
\}
let g:ale_fixers= { 
    \ 'python': ['black'],
\}
let g:ale_fix_on_save=1
let g:ale_sign_column_always=1
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1
let g:ale_set_balloons=1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'
let g:ale_sign_info = 'ℹ'
let g:ale_sign_hint = '➤'
let g:ale_virtualtext_cursor=1
let g:ale_set_highlights=0
hi clear ALEErrorSign
hi clear ALEWarningSign
hi clear ALEInfoSign
hi ALEVirtualTextError ctermbg=NONE ctermfg=Red
hi ALEVirtualTextWarning ctermbg=NONE ctermfg=Yellow
set completeopt+=noinsert 
set completeopt-=preview
let g:float_preview#docked=0


" Language specific lints/syntax
" ------------------------------
" JSON
" ----
autocmd FileType json syntax match Comment +\/\/.\+$+

" Go
" --
let g:go_fmt_command="goimports"

" Rust
" ----
let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

" Keybindings
" -----------
let g:move_key_modifier='C'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='g<C-x>'
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-f> :Rg<SPACE>
noremap <silent> <C-p> :FZF<CR>
nnoremap <silent> gd :ALEGoToDefinitionInSplit<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <silent> vt :vnew <bar> term<CR>a
nnoremap <silent> ht :new <bar> term<CR>a
vnoremap <C-f> y/<C-R>"<CR>
vnoremap <leader>" c""<ESC>P
inoremap jk <ESC>
tnoremap <Esc> <C-\><C-n>

" Keywords
" --------
:command JSON %!jq '.'

" Distraction free mode
runtime presentation.vim
