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

" extensions
" ----------
call plug#begin('~/.vim/plugged')
" vim plugins
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" NOTE: evaluating whether to replace cocnvim with ale
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
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
" language plugins
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'udalov/kotlin-vim'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'reasonml-editor/vim-reason-plus'
call plug#end()

"coc (externally installed: coc-rls, coc-json, coc-python, coc-tsserver)
"---
autocmd FileType json syntax match Comment +\/\/.\+$+

" ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" colors
" ------
set notermguicolors 
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
highlight Normal ctermbg=NONE " for a transparent bg

" move lines
let g:move_key_modifier = 'C'

" LSP
" ---
set hidden
let g:LanguageClient_serverCommands= {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
    \ }


" Misc lang stuff
" ---------------
" disable vtext (RLS is especially onerous)
let g:LanguageClient_useVirtualText=0
" Go command on save
let g:go_fmt_command = "gofmt"
let g:rustfmt_autosave = 1
let g:tmuxline_powerline_separators = 0


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
tnoremap <F1> <C-W>N

" keywords
" --------
:command JSON %!jq '.'

" NOTE: evaluating whether to replace cocnvim with ale
" :command SBT :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })

" multi-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key           = 'g<C-x>'
let g:multi_cursor_next_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" import CoC customizations
" NOTE: evaluating whether to replace cocnvim with ale
" runtime custom.vim 

" import fake presentation mode
runtime presentation.vim
