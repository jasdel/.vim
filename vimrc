" General
"-------------------
syntax enable
filetype plugin indent on
set relativenumber
set number
set wrap linebreak
set shiftwidth=4 tabstop=4
let mapleader=","
set hlsearch
set mouse=a

" Platform Specific
"-------------------
let s:uname = substitute(system("uname -s"), '\n', '', '')

"if s:uname == "Darwin"
"  let g:tagbar_ctags_bin="$HOME/bin/ctags"
"endif

" Cursor improvements
"-------------------
if exists('+colorcolumn')
  set colorcolumn=80
endif
"set cursorline

" Alt swapfile output
"-------------------
set directory=~/.vim/swapfiles//

" Pathogen - manage runtime path
"----------------------
execute pathogen#infect()

" Color and Themes
"----------------------
" Vim color detection
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

let g:rehash256 = 1
colorscheme molokai

" auto completion
"---------------------
set completeopt=menu

"autocmd FileType go setlocal omnifunc=go#complete#Complete

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Vim-Go config
"------------------
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0

" Vim-markdown
"------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Vim-ctrlp
"------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.(git|idea)',
			\ 'file': '\v[\/].(DS_Store)',
 \}


" Key bindings
"------------------
nmap <F12> :set paste!<CR>
