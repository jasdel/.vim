
set nocompatible
filetype off

" Plugins
"------------------
call plug#begin("~/.vim/bundle")

" Color Schemes
Plug 'NLKNguyen/papercolor-theme'

" Language Utils
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" Git Utilities
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'

" Linting and validation
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'

" Fuzz search - Ctrl + P
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Start page
" https://github.com/mhinz/vim-startify/wiki/Plugin-features-in-detail
Plug 'mhinz/vim-startify'

" Spelling
"Plug 'kamykn/spelunker.vim'

call plug#end()

" General
"-------------------

" UI
"-------------------
"if !exists("g:vimrc_loaded")
  "if exists('+colorcolumn')
    set colorcolumn=80
  "endif

  " Vim color detection
  "if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  "endif
  let g:rehash256 = 1

  "colorscheme molokai

  set background=light
  colorscheme PaperColor
"endif


syntax on
filetype on
filetype plugin on
filetype indent on

" Enable line numbering
set relativenumber
set number
" Enable status bar
set laststatus=2

set wrap linebreak
set shiftwidth=4 tabstop=4
let mapleader=","
set hlsearch

"" <TAB>: completion.
"set completeopt=menu
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set directory=~/.vim/.swapfiles/

set backspace=indent,eol,start

" Source Plugins
"------------------
source ~/.vim/config/vim-go.vim
source ~/.vim/config/gitgutter.vim
source ~/.vim/config/lightline.vim
source ~/.vim/config/ale.vim
source ~/.vim/config/fzf.vim
source ~/.vim/config/fzf.vim
"source ~/.vim/config/papercolor.vim
"source ~/.vim/config/spelunker.vim

" Key bindings
"------------------
nmap <F12> :set paste!<CR>
nmap <Leader>nn :set relativenumber<CR>:set number<CR>
nmap <Leader>q :q<CR>

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

"set nospell
" Enable spell checking when known file types
autocmd FileType vim setlocal spell
autocmd FileType text setlocal spell
autocmd FileType go setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType java setlocal spell
autocmd FileType gitcommit setlocal spell

" Enable spell checking when known filetype
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.go setlocal spell
autocmd BufRead,BufNewFile *.rs setlocal spell
autocmd BufRead,BufNewFile *.java setlocal spell
