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
set relativenumber
set mouse=a
set backspace=indent,eol,start
set updatetime=300
set splitbelow
set ignorecase smartcase
set colorcolumn=80
set textwidth=80
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'derekelkins/agda-vim'
" Manually call :GoUpdateBinaries if desired
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'udalov/kotlin-vim'
Plug 'unisonweb/unison', { 'branch': 'trunk', 'rtp': 'editor-support/vim' }

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

" indent by 2 for js/ts
au FileType javascript setlocal ts=2 sw=2 expandtab
au FileType typescript setlocal ts=2 sw=2 expandtab

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

" following functions and mappings provide LSP details in LightLine
" and allow for forced autocompletion via ctrl+.
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
nnoremap <leader>h :CocCommand rust-analyzer.toggleInlayHints<CR>
nnoremap <leader>tr :CocCommand rust-analyzer.syntaxTree<CR>
nnoremap <leader>hr :CocCommand rust-analyzer.viewHir<CR>

" Go
" --
let g:go_fmt_command = "goimports"

" Go (with generics & go2go tool)
" -------------------------------
au BufNewFile,BufRead,BufReadPost *.go2 set syntax=go

" Java
" ----
let java_ignore_javadoc=1

" Turn markdown buffers into PDFs automatically
function! ToPDF()
	augroup markdown_render | au!
		autocmd BufWritePost *.md !md-to-pdf <afile>:p:S
	augroup end
	augroup lhs_render | au!
		autocmd BufWritePost *.lhs !pandoc <afile> -s -o <afile>.pdf
	augroup end
endfunction



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
nmap <silent> gr <Plug>(coc-references-used)

nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-f> :Rg<CR>
noremap <silent> <C-p> :Files<CR>
nnoremap <silent> gf :GFiles<CR>
nnoremap <silent> vt :vnew <bar> term<CR>a
nnoremap <silent> ht :new <bar> term<CR>a
nnoremap <silent> <C-t> :tabNext<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader><SPACE> :CocAction<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>
nnoremap <silent> <space>a  :CocAction<cr>

vnoremap <C-f> y/<C-R>"<CR>
vnoremap <leader>" c""<ESC>P

inoremap jk <ESC>

tnoremap <Esc> <C-\><C-n>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <TAB> <Plug>(coc-range-select)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Keywords
" --------
:command JSON %!jq '.'
:command PDF :call ToPDF()

" Distraction free mode
runtime presentation.vim
