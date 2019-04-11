
set nocompatible
filetype off

" Plugins
"------------------
call plug#begin("~/.vim/bundle")
"Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stevearc/vim-arduino'
"Plug 'junegunn/fzf.vim'
"Plug 'rust-lang/rust.vim'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'zchee/deoplete-go', { 'do': 'make'}
"endif
call plug#end()

" General
"-------------------

" UI
"-------------------
if !exists("g:vimrc_loaded")
  if exists('+colorcolumn')
    set colorcolumn=80
  endif

" Vim color detection
  if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  endif
  let g:rehash256 = 1

  colorscheme molokai
  "let g:molokai_original = 1
endif

if has('mouse')
  "set mouse=a
  "set selectmode=mouse,key
  "set nomousehide
endif

syntax on
filetype on
filetype plugin on
filetype indent on

set relativenumber
set number

set wrap linebreak
set shiftwidth=4 tabstop=4
let mapleader=","
set hlsearch

"" <TAB>: completion.
"set completeopt=menu
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set directory=~/.vim/.swapfiles/

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set backspace=indent,eol,start

" Source Plugins
"------------------
"source ~/.config/nvim/config/ctrlp.vim
source ~/.vim/config/vim-go.vim
source ~/.vim/config/gitgutter.vim
source ~/.vim/config/markdown.vim
source ~/.vim/config/airline.vim
source ~/.vim/config/ale.vim
source ~/.vim/config/fzf.vim

" Key bindings
"------------------
nmap <F12> :set paste!<CR>
nmap <Leader>nn :set relativenumber<CR>:set number<CR>

" Add META(Alt)+i as escape trigger
inoremap jj <esc>

" Add alias for command in new window/buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" Load local config if exists
if filereadable(expand("~/.vim/config/local.vim"))
  source ~/.vim/config/local.vim
endif

" Custom filetypes
"-----------------
autocmd BufNewFile,BufRead *.gotxttmpl set syntax=gotexttmpl

" netrw modifications
" https://shapeshed.com/vim-netrw/
"-------------------
" Remove Banner
let g:netrw_banner = 0
" Detail list view
let g:netrw_liststyle = 3
