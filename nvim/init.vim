language en_US.UTF-8

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'justinmk/vim-sneak'
Plug 'chriskempson/base16-vim'
Plug 'wincent/terminus'
Plug 'wincent/ferret'
Plug 'tpope/vim-commentary'
Plug 'elmcast/elm-vim'
Plug 'justinmk/vim-dirvish'
Plug 'pangloss/vim-javascript'
Plug 'machakann/vim-highlightedyank'
Plug 'pearofducks/ansible-vim'
Plug 'dag/vim-fish'
Plug 'henrik/vim-indexed-search'
Plug 'gluon-lang/vim-gluon'
call plug#end()

let g:elm_setup_keybindings=0
let g:elm_format_autosave=1

let g:rustfmt_autosave=1

let g:sneak#s_next=1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" Convenient jumps between splits.
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

let g:airline#extensions#tabline#enabled=1

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#max_list=7

set hidden
set number
set relativenumber
set noshowmode
set incsearch
set ignorecase
set smartcase
set nohlsearch
set signcolumn=yes
set completeopt=menu,preview,noinsert
set cursorline
set backspace=indent,start,eol
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=3

set laststatus=2

set colorcolumn=100

" Show trailing spaces.
set listchars=tab:►-,trail:·
set list

filetype plugin indent on

" Sane splits.
set splitright
set splitbelow

let mapleader="\<SPACE>"

" <tab>: completion.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nmap <leader><leader> <c-^>

nnoremap <leader>q :bdelete<cr>

nnoremap <tab> :bnext!<cr>
nnoremap <s-tab> :bprev!<cr>

nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlP<cr>

" Redraw the window.
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Don't loose visual selection when using indent.
xnoremap < <gv
xnoremap > >gv

" Add more granularity to undo history.
inoremap <space> <space><c-g>u
inoremap . .<c-g>u
inoremap , ,<c-g>u

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<cr>

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

