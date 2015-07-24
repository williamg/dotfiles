execute pathogen#infect()

" Basic stuff
syntax on
set background=dark
colorscheme gruvbox
set autoread

set number
set clipboard=unnamedplus

set tabstop		=4
set shiftwidth	=4
set softtabstop	=4
set colorcolumn	=80
set smarttab
set autoindent

set incsearch
set showmatch
set hlsearch
set list 
set listchars=tab:\>\ ,eol:¶,trail:~
set cursorline

filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown set spell spellang=en_us
au BufRead,BufNewFile *.ino set filetype=c
au BufRead,BufNewFile *.py set expandtab

au BufRead,BufNewFile *.rs, set filetype=rust ts=4 sw=4 softtabstop=4 expandtab

" More personal stuff
let mapleader = ","

" Fuck esc
inoremap jj <esc>

" New vsplit
noremap <leader>v <C-w>v

" Easier split-screen nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that
noremap j gj
noremap k gk

" Force use of hjkl
inoremap    <Up>    <NOP>
inoremap    <Down>  <NOP>
inoremap    <Left>  <NOP>
inoremap    <Right> <NOP>
noremap     <Up>    <NOP>
noremap     <Down>  <NOP>
noremap     <Left>  <NOP>
noremap     <Right> <NOP>

" Javascript code analyzer
map <C-f> <Esc>:TernRefs<CR>
map <C-t> <Esc>:TernType<CR>
map <C-n> <Esc>:TernRename<CR>
map <C-d> <Esc>:TernDef<CR>
