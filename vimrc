
set nocompatible
filetype off

" Plugins
"------------------
call plug#begin("~/.vim/bundle")

" Color Schemes
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
"Plug 'gilgigilgil/anderson.vim'
Plug 'cormacrelf/vim-colors-github'

" Language Utils
Plug 'fatih/vim-go'
Plug 'jasdel/vim-go-scratchpad'
Plug 'rust-lang/rust.vim'
Plug 'jasdel/vim-smithy'

" Git Utilities
"---------------------
Plug 'airblade/vim-gitgutter'

" Git browsing utilities
" https://github.com/tpope/vim-fugitive
" :GBrowse - open in browser (Github), optional line selection
Plug 'tpope/vim-fugitive'
" Allows opening GBrowse in GitHub
" https://github.com/tpope/vim-rhubarb/
Plug 'tpope/vim-rhubarb'

" Git commit browser
" https://github.com/junegunn/gv.vim
" :GV - commit browser, optional with git log commands
" :GV! - commit browser for current file
Plug 'junegunn/gv.vim'

" Linting and validation
"---------------------
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'

" Fuzz search and other utilities - Ctrl + P
" https://github.com/junegunn/fzf.vim
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
   "set cursorline
  "endif

  " Vim color detection
  "if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  "endif
  let g:rehash256 = 1

  "colorscheme molokai

  " https://jonasjacek.github.io/colors/
  "let g:PaperColor_Theme_Options = {
  "  \   'theme': {
  "  \     'default.light': {
  "  \       'override' : {
  "  \         'color00' : ['#eeeeee', '255'],
  "  \         'linenumber_fg' : ['#444444', '238'],
  "  \         'linenumber_bg' : ['#eeeeee', '255'],
  "  \       }
  "  \     }
  "  \   }
  "  \ }

  set background=light
  "colorscheme PaperColor
  "color paper
  
  " if you use airline / lightline
  let g:airline_theme = "github"
  let g:lightline = { 'colorscheme': 'github' }

  let g:github_colors_soft = 1
  colorscheme github
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

" Deal with Windows + Ubuntu + vim starting in replace mode.
" https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode
"set t_u7=

" gvim options
"set linespace=3
"set guifont=Menlo-Regular:h16
