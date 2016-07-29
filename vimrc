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

"" neocomplete - auto completion
""---------------------
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 0
"let g:neocomplete#sources#syntax#min_keyword_length = 5
set completeopt=menu

"autocmd FileType go setlocal omnifunc=go#complete#Complete

""" Plugin key-mappings.
""inoremap <expr><C-g>     neocomplete#undo_completion()
""inoremap <expr><C-l>     neocomplete#complete_common_string()
""
"" Recommended key-mappings.
""" <CR>: close popup and save indent.
""inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
""function! s:my_cr_function()
""  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
""  " For no inserting <CR> key.
""  "return pumvisible() ? "\<C-y>" : "\<CR>"
""endfunction
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

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
