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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'ncm2/float-preview.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.78'}

" Language plugins
" ----------------
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'damienstanton/vim-swift'

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

" Language specific lints/syntax
" ------------------------------
" JSON
" ----
autocmd FileType json syntax match Comment +\/\/.\+$+

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
noremap <silent> <C-p> :Files<CR>
nnoremap <silent> gf :GFiles<CR>
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
runtime coc.vim
