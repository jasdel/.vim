
set nocompatible
filetype off

"set pyxversion=3
set encoding=utf-8

" Plugins
"------------------
call plug#begin("~/.vim/bundle")

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " https://github.com/Shougo/deoplete.nvim
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Color Schemes
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
"Plug 'gilgigilgil/anderson.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'lucasprag/simpleblack'

" Language Utils
Plug 'fatih/vim-go'
Plug 'jasdel/vim-go-scratchpad'
" rustup component add rls rust-analysis rust-src
Plug 'rust-lang/rust.vim'
Plug 'jasdel/vim-smithy'
Plug 'udalov/kotlin-vim'
Plug 'lepture/vim-jinja'

" code completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"let g:go_test_show_name = 1
filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
"let g:pencil#textwidth = 74

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
"Plug 'junegunn/gv.vim'

" cli utilities
" https://github.com/wsdjeg/vim-fetch
Plug 'wsdjeg/vim-fetch'

" Linting and validation
"---------------------
"Plug 'w0rp/ale'
Plug 'dense-analysis/ale'
"let g:ale_completion_enabled=1

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
"Plug 'iamcco/coc-spell-checker'

call plug#end()

" General
"-------------------

" UI
"-------------------
if !exists("g:vimrc_loaded")
  if exists('+colorcolumn')
    set colorcolumn=80
   set cursorline
  endif

  " Vim color detection
  " https://stackoverflow.com/questions/15375992/
  if $COLORTERM == "screen"
    set t_Co=256
  endif


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

  "set background=light
  "color PaperColor
  "color paper
  "color molokai
  
  " if you use airline / lightline
  "set background=light
  "let g:github_colors_soft = 1
  "color github

  if $ITERM_PROFILE == "Light"
  	set background=light
  	color github
  else
    colorscheme simpleblack
  endif

endif


syntax on
filetype on
filetype plugin on
filetype indent on

" Enable line numbering
set relativenumber
set number

if $ITERM_PROFILE == "Light"
    hi LineNr ctermfg=black
    hi CursorLineNr ctermfg=blue
else
    hi LineNr ctermfg=grey
    hi CursorLineNr ctermfg=yellow
endif


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
"source ~/.vim/config/spelunker.vim

" Key bindings
"------------------
nmap <F12> :set paste!<CR>
nmap <Leader>nn :set relativenumber<CR>:set number<CR>
"nmap <Leader>q :q<CR>

" Add META(Alt)+i as escape trigger
inoremap jj <esc>

" Add alias for command in new window/buffer
":command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

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
autocmd FileType vim setlocal spell spelllang=en_us
autocmd FileType text setlocal spell spelllang=en_us
autocmd FileType go setlocal spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType java setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Enable spell checking when known filetype
"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.go setlocal spell
"autocmd BufRead,BufNewFile *.rs setlocal spell
"autocmd BufRead,BufNewFile *.java setlocal spell

" Deal with Windows + Ubuntu + vim starting in replace mode.
" https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode
"set t_u7=

" gvim options
set linespace=3
set guifont=Menlo-Regular:h16
