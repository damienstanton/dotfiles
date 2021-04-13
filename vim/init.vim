""""""""""
" +----+ "
" | DS | "
" +----+ "
""""""""""

" General Editor Config
" ---------------------
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set number
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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'
Plug 'cormacrelf/vim-colors-github'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
" Colorschemes
" ------
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
" Language plugins
" ----------------
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'damienstanton/vim-swift'
Plug 'fatih/vim-go'
" Manually call :GoUpdateBinaries if desired
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'udalov/kotlin-vim'
Plug 'stevearc/vim-arduino'
call plug#end()

" Style & Function
" ----------------
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Uncomment if running in a possibly non-truecolor term
" if exists('+termguicolors')
"   let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
set termguicolors
set background=dark
colorscheme base16-tomorrow-night
hi normal guibg=NONE ctermbg=NONE

let g:lightline = { 
	\ 'colorscheme': 'Tomorrow_Night',
	\ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ }
	  \}

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-.> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif



let g:tmuxline_powerline_separators=0

set cmdheight=2
set updatetime=300
set signcolumn=yes
set splitright
set splitbelow

" Language specific lints/syntax
" ------------------------------
" JSON
" ----
autocmd FileType json syntax match Comment +\/\/.\+$+

" Rust
" ----
let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

" Go
" --
let g:go_fmt_command = "goimports"

" Go (with generics & go2go tool)
" -------------------------------
au BufNewFile,BufRead,BufReadPost *.go2 set syntax=go

" Java
" ----
let java_ignore_javadoc=1

" Keybindings
" -----------
let g:move_key_modifier='C'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='g<C-x>'
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-f> :Rg<SPACE>
noremap <silent> <C-p> :Files<CR>
nnoremap <silent> gf :GFiles<CR>
nnoremap <silent> vt :vnew <bar> term<CR>a
nnoremap <silent> ht :new <bar> term<CR>a
nnoremap <silent> <C-t> :tabNext<CR>
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader><SPACE> :CocAction<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

vnoremap <C-f> y/<C-R>"<CR>
vnoremap <leader>" c""<ESC>P

inoremap jk <ESC>

tnoremap <Esc> <C-\><C-n>

autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>
nnoremap <silent> <space>a  :CocAction<cr>

" Keywords
" --------
:command JSON %!jq '.'

" Distraction free mode
runtime presentation.vim
