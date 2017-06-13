" Plugin loading with vim-plug
call plug#begin("~/.local/share/nvim/plugged")
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'jsfaint/gen_tags.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'

" Restore nvim sessions in tmux
Plug 'tpope/vim-obsession'

" Typescript-specific
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript'

call plug#end()

" Basic stuff
syntax on
set background=dark
colorscheme gruvbox
set autoread
set number

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
set listchars=tab:>-,trail:~

filetype plugin indent on

" Autocomplete
set completeopt=menu
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#sources.latex=[]
let g:deoplete#sources.typescript=[]

" TAB for completion
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" Manually clear with F5
let g:ctrlp_clear_cache_on_exit = 0

" Use ag if available
if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" Build on save
autocmd! BufWritePost * Neomake
let g:neomake_typescript_enabled_makers = ['tsc']

let mapleader = ","

" Fuck esc
inoremap jj <esc>

" New vsplit
noremap <leader>v <C-w>v

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

" Jump between errors
noremap <leader>, :lprev<CR>
noremap <leader>. :lnext<CR>

" NERDTree
let NERDTreeIgnore=['\.o$', '\.dep$']
noremap <leader>t :NERDTreeMirrorToggle<CR>
noremap <leader>h :NerdTreeSteppedOpen<CR>

" TMUX/nvim hackiness
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Language-specific configuration
au BufRead,BufNewFile *.md set filetype=markdown spell spellang=en_us
au BufRead,BufNewFile *.ino set filetype=c
au BufRead,BufNewFile *.ts set filetype=typescript expandtab
